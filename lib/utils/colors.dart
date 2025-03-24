import 'package:flutter/material.dart';

class AppColors {
  // Primary and Splash Colors
  static const Color primary = Color(0xFF307791); // Primary ##307791
  static const Color splashScreen = Color(0xCC045C7D); // Flash/Splash screen ##045C7DCC

  // Red and Yellow Shades
  static const Color redColor  = Color(0xFFFF4646); // Red #FF4646
  static const Color yellowShade  = Color(0xFFFFCE31); // Rating star #FFCE31

  // Gray and Black Shades
  static const Color darkGray_1  = Color(0xFF353840); // Back buttons icon & Full name in profile screen #353840
  static const Color darkGray_2  = Color(0xFF646464); // Back buttons icon #646464
  static const Color lightGray  = Color(0xFFD9D9D9); // Under border #D9D9D9
  static const Color charcoalGray    = Color(0xFF1C1C1C); // Apple/Google text field #1C1C1C
  static const Color grayColor  = Color(0xFF999999); // Hints #999999
  static const Color filter = Color(0x33000000); // Welcome dialog filter
  static const Color transparentCharcoal = Color(0x73090909); // Room page filter
  static const Color black  = Color(0xFF000000); // Edit icon in profile screen & Input in login/register screen #000000
  static const Color veryLightGray  = Color(0xFFF2F2F2); // Field profile border #F2F2F2

  // White and Soft Shades
  static const Color white  = Color(0xFFffffff); // White #FFFFFF
  static const Color softWhite  = Color(0xFFFAFAFA); // Search field background & Horizontal room card #FAFAFA
  static const Color semiTransparentWhite   = Color(0x40FFFFFF); // Feature Icon background #FFFFFF40

  // Transparent and Semi-Transparent Shades
  static const Color semiTransparentBlack  = Color(0x66000000); // Field icons #00000066
  static const Color deepTransparentBlack  = Color(0xA6000000); // Other sections in Rooms screen #000000A6
  static const Color darkTransparentBlack  = Color(0x9C000000); // Normal text in single room-2 screen #0000009C

  // Brown and Earthy Shades
  static const Color brownShade  = Color(0xFF7C6A46 ); // Disabled feature icon #7C6A46
  static const Color earthyBrown  = Color(0xFF8C7D5D); // Selected section in Rooms screen #8C7D5D

  // Teal and Green Shades
  static const Color tealShade   = Color(0xFF00A699); // Cancel button in alerts #00A699
}


// Usage in Widgets:
/*
Container(
  color: AppColors.primary,
  child: Text("Hello", style: TextStyle(color: AppColors.textPrimary)),
)
*/