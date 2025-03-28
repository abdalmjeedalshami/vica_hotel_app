import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vica_hotel_app/providers/auth/auth_cubit.dart';
import 'package:vica_hotel_app/providers/auth/auth_state.dart';
import 'package:vica_hotel_app/screens/auth/send_otp_screen.dart';
import 'package:vica_hotel_app/screens/auth/sign_up_screen.dart';
import 'package:vica_hotel_app/screens/layout/home_layout.dart';
import 'package:vica_hotel_app/utils/colors.dart';
import 'package:vica_hotel_app/utils/icons.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/widgets/custom_button.dart';
import 'package:vica_hotel_app/widgets/custom_text_field.dart';
import 'package:vica_hotel_app/widgets/raleway_text.dart';
import 'package:vica_hotel_app/widgets/social_login_button.dart';
import '../../providers/home/home_cubit.dart';
import '../../utils/navigation_util.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;

  @override
  void dispose() {
    // Dispose of the controllers to free resources
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

 // Default state for rememberMe checkbox
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            print(state);
            if (state is AuthSuccess) {
              context.read<AuthCubit>().getProfile();
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
            if (state is GetProfileSuccess) {
              print('This is the user info: ${state.user}');
              context.read<HomeCubit>().currentIndex = 0;
              NavigationUtil.navigateTo(context, screen: HomeLayout());
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading || state is GetProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.only(
                        left: responsive(context, 24),
                        right: responsive(context, 24),
                        top: responsive(context, 140)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Logo
                          SvgPicture.asset(
                            AppIcons.logo,
                            colorFilter: ColorFilter.mode(
                                Theme
                                    .of(context)
                                    .primaryColor, BlendMode.srcIn),
                          ),
                          // Replace with your logo

                          SizedBox(height: responsive(context, 60)),

                          // Email TextField
                          customTextField(context,
                              controller: emailController,
                              hintText: 'Email',
                              prefix: AppIcons.email,
                              suffix: AppIcons.check,
                              type: TextInputType.emailAddress),

                          // Password TextField
                          customTextField(context,
                              controller: passwordController,
                              hintText: '********',
                              prefix: AppIcons.lock,
                              type: TextInputType.visiblePassword),

                          SizedBox(height: responsive(context, 10)),

                          // Forgot Password Text Button
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  NavigationUtil.navigateTo(context, screen: const SendOtpScreen());
                                },
                                child: RalewayText.medium('Forgot password?',
                                    color: AppColors.redColor)),
                          ),

                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe = value!;
                                  });
                                },
                              ),
                              const Text("Remember Me"),
                            ],
                          ),

                          SizedBox(height: responsive(context, 10)),

                          // Sign In Button
                          CustomButton(
                            text: 'Sign in',
                            onPressed: () {
                              final email = emailController.text;
                              final password = passwordController.text;

                              context.read<AuthCubit>().login(email, password, rememberMe);
                            },
                            // goTo: HomeLayout(),
                          ),

                          SizedBox(height: responsive(context, 10)),

                          // Register Text Button
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  NavigationUtil.navigateTo(context,
                                      screen: const SignUpScreen(),
                                      withRoute: true);
                                },
                                child: RalewayText.bold('Register now')),
                          ),

                          SizedBox(height: responsive(context, 35)),

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

                          SizedBox(height: responsive(context, 20)),

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
