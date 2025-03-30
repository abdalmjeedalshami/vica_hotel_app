import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:vica_hotel_app/utils/images.dart';
import 'package:vica_hotel_app/utils/navigation_util.dart';
import '../../providers/auth/auth_cubit.dart';
import '../../providers/auth/auth_state.dart';
import '../../utils/responsive_util.dart';
import 'change_password_screen.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String email;

  const VerifyOtpScreen({super.key, required this.email});

  @override
  State<VerifyOtpScreen> createState() => VerifyOtpScreenState();
}

class VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController otpController = TextEditingController();


  @override
  void dispose() {
    // Dispose of the controllers to free resources
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PIN',
          style: TextStyle(color: Theme
              .of(context)
              .primaryColor),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            NavigationUtil.navigateTo(context, screen: const ChangePasswordScreen());
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
          return ListView(
            children: [
              SizedBox(
                  height: MediaQuery
                      .sizeOf(context)
                      .height * .4,
                  child: Image.asset(AppImages.room_1)),
              SizedBox(
                height: responsive(context, 40),
              ),
              Pinput(
                length: 4,
                controller: otpController,
                onCompleted: (otp) {
                  final email = widget.email;
                  final otp = int.tryParse(otpController.text) ?? 0;
                  context.read<AuthCubit>().verifyOtp(email, otp);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
