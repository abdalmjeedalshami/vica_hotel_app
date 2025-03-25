import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vica_hotel_app/providers/auth/auth_cubit.dart';
import 'package:vica_hotel_app/providers/auth/auth_state.dart';
import 'package:vica_hotel_app/screens/auth/otp_page.dart';
import 'package:vica_hotel_app/screens/layout/home_layout.dart';
import 'package:vica_hotel_app/utils/icons.dart';
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
        body: BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          NavigationUtil.navigateTo(context, screen: OtpPage());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(
                    left: responsive(context, 24),
                    right: responsive(context, 24),
                    top: responsive(context, 70)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo
                      SvgPicture.asset(AppIcons.logo,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).primaryColor, BlendMode.srcIn)),

                      SizedBox(height: responsive(context, 50)),

                      // Email
                      customTextField(context,
                          hintText: 'Email',
                          prefix: AppIcons.email,
                          type: TextInputType.emailAddress),

                      // First name
                      customTextField(context,
                          hintText: 'First name', prefix: AppIcons.person),

                      // Last name
                      customTextField(context,
                          hintText: 'Last name', prefix: AppIcons.person),

                      // Phone number
                      customTextField(context,
                          hintText: 'Phone number',
                          prefix: AppIcons.phone,
                          type: TextInputType.phone),

                      // Password
                      customTextField(context,
                          hintText: 'Password',
                          prefix: AppIcons.lock,
                          type: TextInputType.visiblePassword),

                      // Password confirmation
                      customTextField(context,
                          hintText: 'Password confirmation',
                          prefix: AppIcons.lock,
                          type: TextInputType.visiblePassword),

                      // Sign Up Button
                      CustomButton(
                          text: 'Sign up',
                          onPressed: () {
                            context.read<AuthCubit>().register({
                              'first_name': 'aaa',
                              'last_name': 'aaa',
                              'user_name': 'aaaa',
                              'email': 'tiwas31157@hikuhu.com',
                              'password': 'aaaaaaaa',
                              'password_confirmation': 'aaaaaaaa',
                            });
                          }),

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
                        NavigationUtil.navigateTo(context,
                            screen: HomeLayout());
                      }),

                      const SizedBox(height: 20),

                      socialLoginButton(context,
                          text: 'Continue with Google',
                          iconPath: AppIcons.google, onPressed: () {
                        NavigationUtil.navigateTo(context,
                            screen: HomeLayout());
                      })
                    ])));
      },
    ));
  }
}
