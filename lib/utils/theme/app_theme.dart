import 'package:flutter/material.dart';
import '../colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
      ),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.darkGray_1),
          bodyMedium: TextStyle(color: AppColors.darkGray_2),
          labelLarge: TextStyle(color: AppColors.white)),
      iconTheme: const IconThemeData(color: AppColors.black),
      buttonTheme: const ButtonThemeData(buttonColor: AppColors.primary),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.white,
              side: const BorderSide(color: AppColors.lightGray, width: .5))),
    inputDecorationTheme: const InputDecorationTheme(fillColor: AppColors.softWhite),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: AppColors.white)),
    cardColor: AppColors.semiTransparentWhite,
  );

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
      ),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.white),
          // bodyMedium: TextStyle(color: AppColors.lightGray),
          labelLarge: TextStyle(color: AppColors.white)),
      iconTheme: const IconThemeData(color: AppColors.white),
      buttonTheme: const ButtonThemeData(buttonColor: AppColors.tealShade),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.darkGray_1,
              side: const BorderSide(color: AppColors.white, width: .5))),
    inputDecorationTheme: const InputDecorationTheme(fillColor: AppColors.darkGray_1),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: AppColors.black)),
    cardColor: AppColors.darkGray_1,

  );
}

/// Extension to add custom colors to ThemeData
extension CustomTheme on ThemeData {
  Color get logoColor =>
      brightness == Brightness.light ? AppColors.primary : AppColors.primary;

  Color get socialLoginButtonColor =>
      brightness == Brightness.light ? AppColors.black : AppColors.white;

  Color get customTextFieldIconColor =>
      brightness == Brightness.light ? AppColors.semiTransparentBlack : AppColors.white;

  Color get unselectedItemColor =>
      brightness == Brightness.light ? AppColors.darkTransparentBlack : AppColors.white;

  Color get unselectedTitlesSlider =>
      brightness == Brightness.light ? AppColors.white : AppColors.darkTransparentBlack;

  Color get toggleBookingButton =>
      brightness == Brightness.light ? AppColors.softWhite : AppColors.darkGray_1;

  Color get toggleBookingButtonText =>
      brightness == Brightness.light ? AppColors.darkGray_1 : AppColors.black;

  Color get featureIconBackground =>
      brightness == Brightness.light ? AppColors.softWhite : AppColors.charcoalGray;
}
