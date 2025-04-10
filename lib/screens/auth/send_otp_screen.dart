import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vica_hotel_app/providers/auth/auth_cubit.dart';
import 'package:vica_hotel_app/providers/auth/auth_state.dart';
import 'package:vica_hotel_app/screens/auth/verify_otp_screen.dart';
import 'package:vica_hotel_app/utils/icons.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/widgets/custom_button.dart';
import 'package:vica_hotel_app/widgets/custom_text_field.dart';
import '../../utils/navigation_util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SendOtpScreen extends StatefulWidget {

  const SendOtpScreen({super.key});
  @override
  State<SendOtpScreen> createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Dispose of the controllers to free resources
    emailController.dispose();
    super.dispose();
  }

  // Default state for rememberMe checkbox
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              NavigationUtil.navigateTo(context, screen: VerifyOtpScreen(email: emailController.text));
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
                    child: Form(
                      key: formKey,
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
                            ValidatedFieldWrapper(
                              hintText: locale.email,
                              prefix: AppIcons.email,
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) return 'Email required';
                                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) return 'Invalid email';
                                return null;
                              },
                            ),

                            SizedBox(height: responsive(context, 10)),

                            // Send otp Button
                            CustomButton(
                              text: locale.otp,
                              onPressed: () {
                                final email = emailController.text;

                                if (formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().sendOtp(email);
                                } else {}

                                if (email.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Email is required")),
                                  );
                                  return;
                                }

                                if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$").hasMatch(email)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Invalid email format")),
                                  );
                                  return;
                                }
                                },
                              // goTo: HomeLayout(),
                            ),
                          ]),
                    )));
          },
        ));
  }
}
