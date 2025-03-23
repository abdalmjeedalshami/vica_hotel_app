import 'package:flutter/material.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/widgets/raleway_text.dart';
import '../utils/colors.dart';

Widget socialLoginButton(context,
    {required String text, // Button text
    required String iconPath, // Path to icon image
    required VoidCallback onPressed, // Button action
    Color backgroundColor = AppColors.white, // Default background color
    Color borderColor = AppColors.lightGray, // Default border color
    double? borderWidth, // Default border width
    double? borderRadius, // Default border radius
    double fontSize = 14, // Default font size
    Color textColor = AppColors.charcoalGray, // Default text color
    EdgeInsets? padding}) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
      backgroundColor: backgroundColor,
      side: BorderSide(
        color: borderColor,
        width: borderWidth ?? responsive(context, .5),
      ),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(borderRadius ?? responsive(context, 4)),
      ),
      padding: padding ??
          EdgeInsets.symmetric(
              vertical: responsive(context, 12),
              horizontal: responsive(context, 16)),
    ),
    onPressed: onPressed,
    child: Stack(
      children: [
        Row(
          children: [
            Image.asset(
              iconPath, // Use the passed icon path
              width: responsive(context, 24),
              height: responsive(context, 24),
            ),
          ],
        ),
        Center(
          child: RalewayText.medium(text),
        ),
      ],
    ),
  );
}
