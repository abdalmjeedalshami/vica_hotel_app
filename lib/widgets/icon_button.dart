import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData icon;
  final Color? color;
  final Color? textColor;

  const CustomIconButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primary,
        foregroundColor: textColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }
}


// Usage in Screens
/*
CustomIconButton(
  text: "Login with Google",
  icon: Icons.login,
  onPressed: () {
    print("Logging in...");
  },
)
 */