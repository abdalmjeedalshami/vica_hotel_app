import 'package:flutter/material.dart';

import '../screens/auth/login_screen.dart';
import '../widgets/custom_alert_dialog.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    // Set to false if you want to force the user to pick an option.
    builder: (BuildContext context) {
      return CustomAlertDialog(
        onLogoutPressed: () {
          // Perform your logout operations here
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false); // Closes the dialog
          // Navigate or perform further actions if needed
        },
        onCancelPressed: () {
          Navigator.of(context).pop(); // Simply close the dialog
        },
      );
    },
  );
}