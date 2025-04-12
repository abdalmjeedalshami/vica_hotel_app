import 'package:flutter/material.dart';
import '../widgets/custom_alert_dialog.dart';

void showLogoutDialog(BuildContext context, {VoidCallback? onLogoutPressed}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CustomAlertDialog(
        onLogoutPressed: onLogoutPressed ?? (){},
        onCancelPressed: () {
          Navigator.of(context).pop();
        },
      );
    },
  );
}
