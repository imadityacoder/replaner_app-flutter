import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth;

  AuthRepository(this._auth);

  // Expose stream safely
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  /// Sign in with phone
  Future<void> signInWithPhone(
    String phoneNumber,
    Function(String verificationId, int? resendToken) codeSent,
  ) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credential) async {
          // Auto verification (sometimes happens instantly)
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          throw FirebaseAuthException(
            code: e.code,
            message: e.message,
          );
        },
        codeSent: (verificationId, resendToken) {
          codeSent(verificationId, resendToken);
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Resend OTP
  Future<void> resendOtp(
    String phoneNumber,
    int? resendToken,
    Function(String verificationId, int? resendToken) codeSent,
  ) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        forceResendingToken: resendToken,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          throw FirebaseAuthException(
            code: e.code,
            message: e.message,
          );
        },
        codeSent: (verificationId, newResendToken) {
          codeSent(verificationId, newResendToken);
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Verify OTP
  Future<UserCredential> verifyOtp(String verificationId, String smsCode) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    return await _auth.signInWithCredential(credential);
  }

  /// Sign out
  Future<void> signOut() async => await _auth.signOut();
}
