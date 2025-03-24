import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/utils/theme/app_theme.dart';
import '../utils/colors.dart';

Widget customTextField(context,
        {required String hintText,
        required String prefix,
          String? suffix,
        TextInputType? type}) =>
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
          prefixIcon: Padding(
            padding: EdgeInsets.all(responsive(context, 12)),
            child: SvgPicture.asset(
              prefix,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).customTextFieldIconColor, BlendMode.srcIn),
            ),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.all(responsive(context, 16)),
            child: SvgPicture.asset(
              suffix ?? '',
            ),
          ),
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
