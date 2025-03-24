import 'package:flutter/material.dart';
import 'package:vica_hotel_app/widgets/raleway_text.dart';
import '../utils/colors.dart';
import '../utils/responsive_util.dart';

Widget welcomeWidget(context, {required String imagePath, required String title, required String buttonText}) => Container(
  height: responsive(context, 150),
  clipBehavior: Clip.hardEdge,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5),
  ),
  child: Stack(
    alignment: AlignmentDirectional.center,
    children: [
      Image.asset(
        imagePath,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Container(
        color: AppColors.filter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: responsive(context, 95)),
              child: RalewayText.bold(
                  title,
                  color: AppColors.white,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center),
            ),
            SizedBox(height: responsive(context, 8)),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize:
                Size(0, responsive(context, 32)),
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: responsive(context, 15)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: RalewayText.semiBold(buttonText,
                  fontSize: responsive(context, 13)),
            ),
          ],
        ),
      ),
    ],
  ),
);