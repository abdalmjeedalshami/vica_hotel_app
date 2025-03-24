import 'package:flutter/material.dart';
import 'package:vica_hotel_app/utils/theme/app_theme.dart';
import 'package:vica_hotel_app/widgets/raleway_text.dart';
import '../utils/colors.dart';
import '../utils/responsive_util.dart';

class ToggleButton extends StatelessWidget {
  final bool isSelected; // Pass the selected state
  final VoidCallback onTap; // Pass the tap callback

  const ToggleButton({
    Key? key,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: responsive(context, 12)),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : null,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: RalewayText.medium(
              'Active',
              color: isSelected
                  ? AppColors.white
                  : Theme.of(context).toggleBookingButtonText,
            ),
          ),
        ),
      ),
    );
  }
}
