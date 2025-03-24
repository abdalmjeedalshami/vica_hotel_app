import 'package:flutter/material.dart';
import 'package:vica_hotel_app/utils/icons.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/utils/theme/app_theme.dart';
import '../utils/colors.dart';

Widget customTextField(
  context, {
  required String hintText,
  required String assetPath,
      TextInputType? type
}) =>
    Padding(
      padding: EdgeInsets.only(bottom: responsive(context, 10)),
      child: TextFormField(
        style: TextStyle(
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w500,
          fontSize: responsive(context, 14),
        ),
        keyboardType: type,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
              width: responsive(context, 50),
              height: responsive(context, 50),
              child: Image.asset(assetPath, color: Theme.of(context).customTextFieldIconColor,)),
          suffixIcon: SizedBox(
              width: responsive(context, 50),
              height: responsive(context, 50),
              child: Image.asset(AppIcons.check)),
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.grayColor,
            fontFamily: 'Ralewa',
            fontWeight: FontWeight.w500,
            fontSize: responsive(context, 14),
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.lightGray, width: responsive(context, 1))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.lightGray, width: responsive(context, 1))),
        ),
      ),
    );
