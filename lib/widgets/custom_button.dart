import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Widget goTo;
  final Color color;
  final Color textColor;
  final double? width;
  final double? height;
  final VoidCallback? onTap;

  const CustomButton({
    super.key,
    required this.text,
    required this.goTo,
    this.color = AppColors.primary,
    this.textColor = AppColors.white,
    this.width,
    this.height,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: () {
          onTap;
          Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => goTo,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1, 0);
                const end = Offset.zero;
                const curve = Curves.linear;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                    position: offsetAnimation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 400),
            ),
                (route) => false,
          );
        },
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Raleway',
              fontSize: 17, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}


// Usage in Screens
/*
CustomButton(
  text: "Book Now",
  goTo: Screen()
)
 */