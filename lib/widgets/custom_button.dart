import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color = AppColors.primary,
    this.textColor = AppColors.white,
    this.width,
    this.height,
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
        onPressed: onPressed,
        // onPressed: () {
          /*context.read<AuthCubit>().register({
            'first_name': 'aaa',
            'last_name': 'aaa',
            'user_name': 'aaaa',
            'email': 'tiwas31157@hikuhu.com',
            'password': 'aaaaaaaa',
            'password_confirmation': 'aaaaaaaa',
          });*/
          // Navigator.of(context).pushAndRemoveUntil(
          //   PageRouteBuilder(
          //     pageBuilder: (context, animation, secondaryAnimation) => goTo,
          //     transitionsBuilder:
          //         (context, animation, secondaryAnimation, child) {
          //       const begin = Offset(1, 0);
          //       const end = Offset.zero;
          //       const curve = Curves.linear;
          //
          //       var tween = Tween(begin: begin, end: end)
          //           .chain(CurveTween(curve: curve));
          //       var offsetAnimation = animation.drive(tween);
          //
          //       return SlideTransition(
          //           position: offsetAnimation, child: child);
          //     },
          //     transitionDuration: const Duration(milliseconds: 400),
          //   ),
          //       (route) => false,
          // );
        // },
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