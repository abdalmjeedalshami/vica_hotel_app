import 'package:flutter/material.dart';
import 'package:vica_hotel_app/screens/auth/sign_up_screen.dart';
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

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(
                    left: responsive(context, 16),
                    right: responsive(context, 16),
                    top: responsive(context, 140)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo
                      Image.asset(
                        AppImages.logo,
                        color: Theme.of(context).primaryColor,
                      ),
                      // Replace with your logo

                      SizedBox(height: responsive(context, 60)),

                      // Email TextField
                      customTextField(context,
                          hintText: 'Email', assetPath: AppIcons.email, type: TextInputType.emailAddress),

                      // Password TextField
                      customTextField(context,
                          hintText: '********', assetPath: AppIcons.lock, type: TextInputType.visiblePassword),

                      SizedBox(height: responsive(context, 10)),

                      // Forgot Password Text Button
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: RalewayText.medium('Forgot password?',
                                color: AppColors.redColor)),
                      ),

                      SizedBox(height: responsive(context, 10)),

                      // Sign In Button
                      const CustomButton(
                        text: 'Sign in',
                        goTo: HomeLayout(index: 0,),
                      ),

                      SizedBox(height: responsive(context, 10)),

                      // Register Text Button
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              NavigationUtil.navigateTo(
                                  context, screen:  const SignUpScreen(), withRoute: true);
                            },
                            child: RalewayText.bold('Register now')),
                      ),

                      SizedBox(height: responsive(context, 35)),

                      // Or Text
                      RalewayText.semiBold('OR'),

                      SizedBox(height: responsive(context, 35)),

                      // Apple Sign-In Button
                      socialLoginButton(
                        context,
                        text: 'Continue with Apple',
                        iconPath: AppIcons.apple,
                        onPressed: () {
                          NavigationUtil.navigateTo(
                              context, screen:  const HomeLayout(index: 0,));
                        }
                      ),

                      SizedBox(height: responsive(context, 20)),

                      socialLoginButton(context,
                          text: 'Continue with Google',
                          iconPath: AppIcons.google, onPressed: () {
                        NavigationUtil.navigateTo(context, screen:  const HomeLayout(index: 0,));
                      })
                    ]))));
  }
}
