import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:vica_hotel_app/screens/auth/login_screen.dart';
import 'package:vica_hotel_app/utils/colors.dart';
import 'package:vica_hotel_app/utils/icons.dart';
import 'package:vica_hotel_app/utils/navigation_util.dart';
import '../../providers/auth/auth_cubit.dart';
import '../../providers/auth/auth_state.dart';
import '../../utils/responsive_util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class OtpPage extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();
  final String email;

  OtpPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.otp,
          style: TextStyle(color: Theme
              .of(context)
              .primaryColor),
        ),
        centerTitle: true,
      ),
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
          return ListView(
            children: [
              SizedBox(height: responsive(context, 200)),
              SvgPicture.asset(
                AppIcons.logo,
                width: responsive(context, 100),
                height: responsive(context, 100),
                colorFilter:
                const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
              SizedBox(
                height: responsive(context, 40),
              ),
              Pinput(
                length: 4,
                controller: otpController,
                onCompleted: (otp) {
                  final otp = int.tryParse(otpController.text) ?? 0;
                  context.read<AuthCubit>().verifyEmail(email, otp);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
