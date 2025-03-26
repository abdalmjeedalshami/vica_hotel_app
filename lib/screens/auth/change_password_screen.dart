import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vica_hotel_app/providers/auth/auth_cubit.dart';
import 'package:vica_hotel_app/providers/auth/auth_state.dart';
import 'package:vica_hotel_app/screens/auth/login_screen.dart';
import 'package:vica_hotel_app/utils/icons.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/widgets/custom_button.dart';
import 'package:vica_hotel_app/widgets/custom_text_field.dart';
import '../../utils/navigation_util.dart';

class ChangePasswordScreen extends StatefulWidget {

  const ChangePasswordScreen({super.key});
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers to free resources
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  // Default state for rememberMe checkbox
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              NavigationUtil.navigateTo(context, screen: const LoginScreen());
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
                              controller: passwordController,
                              hintText: '********',
                              prefix: AppIcons.lock,
                              suffix: AppIcons.check,
                              type: TextInputType.visiblePassword),

                          // Password TextField
                          customTextField(context,
                              controller: passwordConfirmationController,
                              hintText: '********',
                              prefix: AppIcons.lock,
                              type: TextInputType.visiblePassword),

                          SizedBox(height: responsive(context, 10)),

                          SizedBox(height: responsive(context, 10)),

                          // Change password Button
                          CustomButton(
                            text: 'Change password',
                            onPressed: () {
                              final password = passwordController.text;
                              final passwordConfirmation = passwordConfirmationController.text;

                              if (password.isEmpty || passwordConfirmation.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Please fill all fields")),
                                );
                                return;
                              }

                              if (password != passwordConfirmation) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Passwords do not match")),
                                );
                                return;
                              }

                              context.read<AuthCubit>().changePassword(password, passwordConfirmation);
                            },
                            // goTo: HomeLayout(),
                          ),
                        ])));
          },
        ));
  }
}
