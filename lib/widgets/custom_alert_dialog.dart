import 'package:flutter/material.dart';
import 'package:vica_hotel_app/utils/colors.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/widgets/raleway_text.dart';

class CustomAlertDialog extends StatelessWidget {
  final VoidCallback onLogoutPressed;
  final VoidCallback onCancelPressed;

  const CustomAlertDialog({super.key,
    required this.onLogoutPressed,
    required this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Question text
            RalewayText.medium('Are you sure?',fontSize: responsive(context, 16)),
            const SizedBox(height: 20),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Logout Button
                ElevatedButton(
                  onPressed: onLogoutPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.redColor, // Red for Logout button
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                  ),
                  child: RalewayText.medium('Logout',fontSize: responsive(context, 16), color: AppColors.white),
                ),
                // Cancel Button
                ElevatedButton(
                  onPressed: onCancelPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.tealShade, // Grey for Cancel button
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                  ),
                  child: RalewayText.medium('Cancel',fontSize: responsive(context, 16), color: AppColors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
