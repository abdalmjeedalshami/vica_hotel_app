import 'package:flutter/material.dart';

class NavigationUtil {
  // Linear navigation with a "move in from right" animation
  static void navigateTo(BuildContext context, {required Widget screen, bool withRoute = false}) {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Start off-screen to the right
          const end = Offset.zero; // End position (on-screen)
          const curve = Curves.linear; // Linear animation curve

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation, // Applies the slide animation
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 400), // 400ms animation duration
      ),
          (route) => withRoute
    );
  }
  static void popScreen(BuildContext context) {
    Navigator.pop(context);
  }
}
