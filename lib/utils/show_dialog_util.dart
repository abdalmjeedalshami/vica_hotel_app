import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vica_hotel_app/providers/home/home_cubit.dart';
import 'package:vica_hotel_app/utils/navigation_util.dart';

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
          NavigationUtil.navigateTo(context, screen: LoginScreen()); // Closes the dialog
          context.read<HomeCubit>().currentIndex = 0;
          // Navigate or perform further actions if needed
        },
        onCancelPressed: () {
          Navigator.of(context).pop(); // Simply close the dialog
        },
      );
    },
  );
}