import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/utils/theme/app_theme.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';

Widget customTextField(context,
        {required String hintText,
        required String prefix,
          TextEditingController? controller,
          String? suffix,
        TextInputType? type,
          String? Function(String?)? validator,
          void Function(String)? onFieldSubmitted, // ← add this
          void Function(String)? onChange
        }) =>
    Padding(
      padding: EdgeInsets.only(bottom: responsive(context, 10)),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w500,
          fontSize: responsive(context, 14),
        ),
        keyboardType: type,
        validator: validator,
        onChanged: onChange,
        onFieldSubmitted: onFieldSubmitted, // ← use it
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.all(responsive(context, 12)),
            child: SvgPicture.asset(
              prefix,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).customTextFieldIconColor, BlendMode.srcIn),
            ),
          ),
          suffixIcon: suffix != null
              ? Padding(
            padding: EdgeInsets.all(responsive(context, 16)),
            child: SvgPicture.asset(suffix),
          )
              : null,
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


class ValidatedFieldWrapper extends StatefulWidget {
  final String hintText;
  final String prefix;
  final TextEditingController? controller;
  final TextInputType? type;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;

  const ValidatedFieldWrapper({
    super.key,
    required this.hintText,
    required this.prefix,
    this.controller,
    this.type,
    this.validator,
    this.onChange
  });

  @override
  State<ValidatedFieldWrapper> createState() => _ValidatedFieldWrapperState();
}

class _ValidatedFieldWrapperState extends State<ValidatedFieldWrapper> {
  bool showSuffix = false;

  void validateField() {
    final result = widget.validator?.call(widget.controller?.text);
    setState(() {
      showSuffix = result == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return customTextField(
      context,
      controller: widget.controller,
      hintText: widget.hintText,
      prefix: widget.prefix,
      suffix: showSuffix ? AppIcons.check : null,
      type: widget.type,
      validator: widget.validator,
      onFieldSubmitted: (_) => validateField(),
    );
  }
}


