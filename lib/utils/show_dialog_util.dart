import 'package:flutter/material.dart';
import '../widgets/custom_alert_dialog.dart';

void showLogoutDialog(BuildContext context, {VoidCallback? onLogoutPressed}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    // Set to false if you want to force the user to pick an option.
    builder: (BuildContext context) {
      return CustomAlertDialog(
        onLogoutPressed: onLogoutPressed ?? (){},
        onCancelPressed: () {
          Navigator.of(context).pop(); // Simply close the dialog
        },
      );
    },
  );
}
