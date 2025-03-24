import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vica_hotel_app/utils/theme/app_theme.dart';

import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/responsive_util.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onSearch;
  final ValueChanged<String>? onChanged;

  const SearchField({
    super.key,
    required this.controller,
    this.hintText = 'Search for our nearby hotel',
    this.onSearch,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: responsive(context, 20)),
      child: Container(
        height: responsive(context, 45),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: responsive(context, 12),
                  fontWeight: FontWeight.w500,
                ),

                prefixIcon: Container(
                  padding: EdgeInsets.all(responsive(context, 16)),
                  child: SvgPicture.asset(
                    AppIcons.search,
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).customTextFieldIconColor,
                        BlendMode.srcIn),
                  ),
                ),
                // prefixIcon: Image.asset(AppIcons.search,
                //     color: Theme.of(context).customTextFieldIconColor),
                suffixIcon: Container(
                  padding: EdgeInsets.all(responsive(context, 16)),
                  child: SvgPicture.asset(
                    AppIcons.downArrow,
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).customTextFieldIconColor,
                        BlendMode.srcIn),
                  ),
                ),
                // suffixIcon: Image.asset(AppIcons.downArrow,
                //     color: Theme.of(context).customTextFieldIconColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
                filled: true,
              ),
              onChanged: onChanged,
            ),
            Padding(
              padding: EdgeInsets.only(right: responsive(context, 45)),
              child: Container(
                  width: responsive(context, 1),
                  height: responsive(context, 30),
                  color: AppColors.lightGray),
            )
          ],
        ),
      ),
    );
  }
}

// Usage in Screens
/*
TextEditingController searchController = TextEditingController();


 */
