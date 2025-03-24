import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vica_hotel_app/providers/main/main_state.dart';
import 'package:vica_hotel_app/widgets/poppins_text.dart';
import '../providers/main/main_cubit.dart';
import '../utils/colors.dart';
import '../utils/responsive_util.dart';

Widget titlesSlider(context, {Color? selectedColor}) => SizedBox(
  height: responsive(context, 20),
  child: BlocBuilder<MainCubit, MainState>(
  builder: (context, state) {
    MainCubit mainCubit = context.read<MainCubit>();
    return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 5, // Number of slider items
    itemBuilder: (context, index) {
      if (index == 0) {
        return Padding(
          padding: EdgeInsets.only(right: responsive(context, 18)),
          child: PoppinsText.semiBold('The Royal',
              color: selectedColor ?? Theme.of(context).primaryColor, fontSize: responsive(context, 12)),
        );
      } else {
        return Padding(
          padding: EdgeInsets.only(right: responsive(context, 18)),
          child: PoppinsText.regular('King’s suite',
              color: mainCubit.isLightTheme ? AppColors.darkTransparentBlack : AppColors.white,
              fontSize: responsive(context, 12)),
        );
      }
    },
  );
  },
),
);