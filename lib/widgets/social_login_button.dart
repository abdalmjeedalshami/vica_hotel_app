import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/utils/theme/app_theme.dart';
import 'package:vica_hotel_app/widgets/raleway_text.dart';
import '../utils/colors.dart';

Widget socialLoginButton(context,
    {required String text, // Button text
    required String iconPath, // Path to icon image
    required VoidCallback onPressed, // Button action
    double? borderWidth, // Default border width
    double? borderRadius, // Default border radius
    double fontSize = 14, // Default font size
    Color textColor = AppColors.charcoalGray, // Default text color
    EdgeInsets? padding}) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
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
        SvgPicture.asset(iconPath),
        Center(
          child: RalewayText.medium(text, color: Theme.of(context).socialLoginButtonColor),
        ),
      ],
    ),
  );
}
