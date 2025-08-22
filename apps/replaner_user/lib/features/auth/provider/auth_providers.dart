import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

// FirebaseAuth instance provider
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

// State for verificationId
final verificationIdProvider = StateProvider<String?>((ref) => null);

// State for resendToken
final resendTokenProvider = StateProvider<int?>((ref) => null);

// State for phoneNumber
final phoneNumberProvider = StateProvider<String?>((ref) => null);

// AuthController provider
final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<User?>>((ref) {
      return AuthController(ref);
    });

class AuthController extends StateNotifier<AsyncValue<User?>> {
  AuthController(this.ref) : super(const AsyncValue.data(null));

  final Ref ref;

  /// Send OTP
  Future<void> sendOtp(String phoneNumber) async {
    final auth = ref.read(firebaseAuthProvider);

    ref.read(phoneNumberProvider.notifier).state = phoneNumber;

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) async {
        await auth.signInWithCredential(credential);
        state = AsyncValue.data(auth.currentUser);
      },
      verificationFailed: (e) {
        state = AsyncValue.error(e, StackTrace.current);
      },
      codeSent: (verificationId, resendToken) {
        ref.read(verificationIdProvider.notifier).state = verificationId;
        ref.read(resendTokenProvider.notifier).state = resendToken;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        ref.read(verificationIdProvider.notifier).state = verificationId;
      },
    );
  }

  /// Resend OTP
  Future<void> resendOtp() async {
    final auth = ref.read(firebaseAuthProvider);
    final phoneNumber = ref.read(phoneNumberProvider);
    final resendToken = ref.read(resendTokenProvider);

    if (phoneNumber == null) {
      state = AsyncValue.error("Phone number not found", StackTrace.current);
      return;
    }

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      forceResendingToken: resendToken,
      verificationCompleted: (credential) async {
        await auth.signInWithCredential(credential);
        state = AsyncValue.data(auth.currentUser);
      },
      verificationFailed: (e) {
        state = AsyncValue.error(e, StackTrace.current);
      },
      codeSent: (verificationId, newResendToken) {
        ref.read(verificationIdProvider.notifier).state = verificationId;
        ref.read(resendTokenProvider.notifier).state = newResendToken;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        ref.read(verificationIdProvider.notifier).state = verificationId;
      },
    );
  }

  /// Verify OTP
  Future<void> verifyOtp(String otp) async {
    final auth = ref.read(firebaseAuthProvider);
    final verificationId = ref.read(verificationIdProvider);

    if (verificationId == null) {
      state = AsyncValue.error("No verificationId found", StackTrace.current);
      return;
    }

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      final userCredential = await auth.signInWithCredential(credential);
      state = AsyncValue.data(userCredential.user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Sign out
  Future<void> signOut() async {
    await ref.read(firebaseAuthProvider).signOut();
    state = const AsyncValue.data(null);
  }
}
