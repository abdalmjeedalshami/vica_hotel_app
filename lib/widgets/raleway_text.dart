import 'package:flutter/material.dart';
import 'package:vica_hotel_app/utils/colors.dart';

class RalewayText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;

  const RalewayText({
    Key? key,
    required this.text,
    required this.style,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style,
    );
  }

  // Predefined Medium Text
  static RalewayText medium(String text,
      {Color color = AppColors.black, double fontSize = 14, TextOverflow overflow = TextOverflow.ellipsis}) {
    return RalewayText(
      text: text,
      style: TextStyle(
        fontFamily: 'Raleway',
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        overflow: overflow,
        color: color,
      ),
    );
  }

  // Predefined Semi-Bold Text
  static RalewayText semiBold(String text,
      {Color color = AppColors.primary, double fontSize = 15, TextOverflow overflow = TextOverflow.ellipsis}) {
    return RalewayText(
      text: text,
      style: TextStyle(
        fontFamily: 'Raleway',
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
        overflow: overflow,
        color: color,
      ),
    );
  }

  // Predefined Bold Text
  static RalewayText bold(String text,
      {Color color = AppColors.primary, double fontSize = 15, TextOverflow overflow = TextOverflow.ellipsis, TextAlign? textAlign}) {
    return RalewayText(
      text: text,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        fontFamily: 'Raleway',
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        overflow: overflow,
        color: color,
      ),
    );
  }
}
