import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Roboto',
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.background,
      ),

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.primary,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),

      // Text
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: AppColors.primary, fontSize: 16),
        bodyMedium: TextStyle(color: AppColors.blackLight, fontSize: 14),
        titleLarge: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),

      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.secondary,

          textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: BorderSide(color: AppColors.primary),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),

      // Icon Buttons & Icons
      iconTheme: IconThemeData(color: AppColors.primary, size: 24),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(AppColors.primary),
          overlayColor: WidgetStateProperty.all(
            AppColors.grey.withValues(alpha: 0.2),
          ),
        ),
      ),

      // Text Fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
        fillColor: AppColors.whiteLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.accentDark, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.accentDark, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.accentDark, width: 2),
        ),
        hintStyle: TextStyle(color: AppColors.blackLight),
        prefixStyle: TextStyle(
          color: AppColors.blackLight,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        suffixStyle: TextStyle(color: AppColors.blackLight),
      ),

      // Containers via CardTheme (for consistency)
      cardTheme: CardThemeData(
        color: AppColors.whiteLight,
        shadowColor: AppColors.grey.withValues(alpha: 0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        margin: const EdgeInsets.all(8),
      ),
    );
  }
}
