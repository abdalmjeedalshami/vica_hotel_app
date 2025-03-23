import 'package:flutter/material.dart';
import 'package:vica_hotel_app/widgets/poppins_text.dart';
import '../utils/colors.dart';
import '../utils/responsive_util.dart';

Widget titlesSlider(context, {Color selectedColor = AppColors.primary}) => SizedBox(
  height: responsive(context, 20),
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 5, // Number of slider items
    itemBuilder: (context, index) {
      if (index == 0) {
        return Padding(
          padding: EdgeInsets.only(right: responsive(context, 18)),
          child: PoppinsText.semiBold('The Royal',
              color: selectedColor, fontSize: responsive(context, 12)),
        );
      } else {
        return Padding(
          padding: EdgeInsets.only(right: responsive(context, 18)),
          child: PoppinsText.regular('King’s suite',
              color: AppColors.deepTransparentBlack,
              fontSize: responsive(context, 12)),
        );
      }
    },
  ),
);