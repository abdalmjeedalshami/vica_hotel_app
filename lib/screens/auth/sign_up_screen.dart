import 'package:flutter/material.dart';
import 'package:vica_hotel_app/screens/layout/home_layout.dart';
import 'package:vica_hotel_app/utils/colors.dart';
import 'package:vica_hotel_app/utils/icons.dart';
import 'package:vica_hotel_app/utils/images.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/widgets/custom_button.dart';
import 'package:vica_hotel_app/widgets/custom_text_field.dart';
import 'package:vica_hotel_app/widgets/raleway_text.dart';
import 'package:vica_hotel_app/widgets/social_login_button.dart';

import '../../utils/navigation_util.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(
                    left: responsive(context, 16),
                    right: responsive(context, 16),
                    top: responsive(context, 50)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo
                      Image.asset(
                        AppImages.logo,
                        color: AppColors.primary,
                      ),

                      SizedBox(height: responsive(context, 50)),

                      // Email
                      customTextField(context,
                          hintText: 'Email', assetPath: AppIcons.email, type: TextInputType.emailAddress),

                      // First name
                      customTextField(context,
                          hintText: 'First name', assetPath: AppIcons.person),

                      // Last name
                      customTextField(context,
                          hintText: 'Last name', assetPath: AppIcons.person),

                      // Phone number
                      customTextField(context,
                          hintText: 'Phone number', assetPath: AppIcons.phone, type: TextInputType.phone),

                      // Password
                      customTextField(context,
                          hintText: 'Password', assetPath: AppIcons.lock, type: TextInputType.visiblePassword),

                      // Password confirmation
                      customTextField(context,
                          hintText: 'Password confirmation',
                          assetPath: AppIcons.lock, type: TextInputType.visiblePassword),

                      // Sign Up Button
                      const CustomButton(text: 'Sign up', goTo: HomeLayout(index: 0,)),

                      SizedBox(height: responsive(context, 10)),

                      // Sign in Button
                      Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {
                                NavigationUtil.popScreen(context);
                              },
                              child: RalewayText.bold('Sign in'))),

                      // Or Text
                      RalewayText.semiBold('OR'),

                      SizedBox(height: responsive(context, 35)),

                      // Apple Sign-In Button
                      socialLoginButton(context,
                          text: 'Continue with Apple',
                          iconPath: AppIcons.apple, onPressed: () {
                        NavigationUtil.navigateTo(context, screen:  const HomeLayout(index: 0,));
                      }),

                      const SizedBox(height: 20),

                      socialLoginButton(context,
                          text: 'Continue with Google',
                          iconPath: AppIcons.google, onPressed: () {
                        NavigationUtil.navigateTo(context, screen:  const HomeLayout(index: 0,));
                      })
                    ]))));
  }
}
