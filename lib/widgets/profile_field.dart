import 'package:flutter/material.dart';
import 'package:vica_hotel_app/widgets/raleway_text.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/responsive_util.dart';

/// A reusable widget for profile information fields that displays:
/// • An icon representing the field
/// • A label and its value
/// • An edit button on the right side.
class ProfileField extends StatelessWidget {
  final String iconPath;
  final String label;
  final String value;
  final VoidCallback onEdit;
  final Color prefixColor;

  const ProfileField({
    Key? key,
    required this.iconPath,
    required this.label,
    required this.value,
    required this.onEdit,
    this.prefixColor = AppColors.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: responsive(context, 12),
          horizontal: responsive(context, 16)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.veryLightGray,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            color: prefixColor,
          ),
          SizedBox(width: responsive(context, 16)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Field label (e.g. "Full Name")
                RalewayText.medium(label,
                    fontSize: responsive(context, 15),
                    color: AppColors.primary),
                SizedBox(height: responsive(context, 4)),
                // Field value
                RalewayText.medium(value,
                    fontSize: responsive(context, 8),
                    color: AppColors.darkGray_2)
              ],
            ),
          ),
          // The edit icon on the right side.
          Image.asset(
            AppIcons.edit,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }
}
