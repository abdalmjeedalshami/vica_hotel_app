import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vica_hotel_app/providers/auth/auth_cubit.dart';
import 'package:vica_hotel_app/providers/auth/auth_state.dart';
import 'package:vica_hotel_app/screens/auth/otp_page.dart';
import 'package:vica_hotel_app/utils/icons.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/widgets/custom_button.dart';
import 'package:vica_hotel_app/widgets/custom_text_field.dart';
import 'package:vica_hotel_app/widgets/raleway_text.dart';
import 'package:vica_hotel_app/widgets/social_login_button.dart';
import '../../utils/navigation_util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Dispose of the controllers to free resources
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          NavigationUtil.navigateTo(context,
              screen: OtpPage(email: emailController.text));
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
                child: Form(
                  key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Logo
                        SvgPicture.asset(AppIcons.logo,
                            colorFilter: ColorFilter.mode(
                                Theme.of(context).primaryColor,
                                BlendMode.srcIn)),

                        SizedBox(height: responsive(context, 50)),

                        // Email
                        customTextField(context,
                            controller: emailController,
                            hintText: locale.email,
                            prefix: AppIcons.email,
                            type: TextInputType.emailAddress,
                            validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        }),

                        // First name
                        customTextField(context,
                            controller: firstNameController,
                            hintText: locale.first_name,
                            prefix: AppIcons.person, validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (!RegExp(r'^[a-zA-Z]{2,}$').hasMatch(value)) {
                            return 'Only letters, min 2 characters';
                          }
                          return null;
                        }),

                        // Last name
                        customTextField(context,
                            controller: lastNameController,
                            hintText: locale.last_name,
                            prefix: AppIcons.person, validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Username is required';
                          }
                          if (!RegExp(r'^[a-zA-Z0-9_]{3,}$').hasMatch(value)) {
                            return 'Only letters, numbers, underscores\nMin 3 characters';
                          }
                          return null;
                        }),

                        // Phone number
                        customTextField(context,
                            controller: phoneNumberController,
                            hintText: locale.phone_number,
                            prefix: AppIcons.phone,
                            type: TextInputType.phone),

                        // Password
                        customTextField(context,
                            controller: passwordController,
                            hintText: locale.password,
                            prefix: AppIcons.lock,
                            type: TextInputType.visiblePassword,
                            validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (!RegExp(
                                  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$')
                              .hasMatch(value)) {
                            return 'Min 8 chars, 1 upper, 1 lower, 1 number';
                          }
                          return null;
                        }),

                        // Password confirmation
                        customTextField(context,
                            controller: passwordConfirmationController,
                            hintText: locale.password_confirmation,
                            prefix: AppIcons.lock,
                            type: TextInputType.visiblePassword,
                            validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        }),

                        // Sign Up Button
                        CustomButton(
                            text: locale.sign_up,
                            onPressed: () {
                              if (passwordController.text !=
                                  passwordConfirmationController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Passwords do not match")),
                                );
                                return;
                              }

                              if (formKey.currentState!.validate()) {
                                final firstName = firstNameController.text;
                                final lastName = lastNameController.text;
                                final username = phoneNumberController.text;
                                final email = emailController.text;
                                final password = passwordController.text;
                                final passwordConfirmation =
                                    passwordConfirmationController.text;

                                context.read<AuthCubit>().register({
                                  'first_name': firstName,
                                  'last_name': lastName,
                                  'user_name': username,
                                  'email': email,
                                  'password': password,
                                  'password_confirmation': passwordConfirmation,
                                });
                              } else {}
                            }),

                        SizedBox(height: responsive(context, 10)),

                        // Sign in Button
                        Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                                onTap: () {
                                  NavigationUtil.popScreen(context);
                                },
                                child: RalewayText.bold(locale.login))),

                        // Or Text
                        RalewayText.semiBold(locale.or),

                        SizedBox(height: responsive(context, 35)),

                        // Apple Sign-In Button
                        socialLoginButton(context,
                            text: locale.continue_with_apple,
                            iconPath: AppIcons.apple,
                            onPressed: () {}),

                        const SizedBox(height: 20),

                        socialLoginButton(context,
                            text: locale.continue_with_google,
                            iconPath: AppIcons.google,
                            onPressed: () {})
                      ]),
                )));
      },
    ));
  }
}
