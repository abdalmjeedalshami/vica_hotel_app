import 'package:flutter/material.dart';

class PoppinsText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final TextOverflow overflow;

  const PoppinsText({
    Key? key,
    required this.text,
    required this.style,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.ellipsis
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
  static PoppinsText regular(String text, {Color color = Colors.black, double fontSize = 16, TextOverflow overflow = TextOverflow.ellipsis}) {
    return PoppinsText(
      text: text,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        color: color,
        overflow: overflow
      ),
    );
  }

  // Predefined Semi-Bold Text
  static PoppinsText medium(String text, {Color color = Colors.black, double fontSize = 18, TextOverflow overflow = TextOverflow.ellipsis}) {
    return PoppinsText(
      text: text,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        color: color,
        overflow: overflow
      ),
    );
  }

  // Predefined Bold Text
  static PoppinsText semiBold(String text, {Color color = Colors.black, double fontSize = 20, TextOverflow overflow = TextOverflow.ellipsis}) {
    return PoppinsText(
      text: text,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
        color: color,
        overflow: overflow,
      ),
    );
  }
}
