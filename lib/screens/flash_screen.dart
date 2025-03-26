import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vica_hotel_app/providers/auth/auth_state.dart';
import 'package:vica_hotel_app/screens/layout/home_layout.dart';
import 'package:vica_hotel_app/utils/colors.dart';
import 'package:vica_hotel_app/utils/icons.dart';
import 'package:vica_hotel_app/utils/navigation_util.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';

import '../providers/auth/auth_cubit.dart';
import 'auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 800ms and then navigate to the Login screen with custom animation
    Future.delayed(const Duration(milliseconds: 800), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const LoginScreen();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Define a right curve linear transition animation
            const begin = Offset(1.0, 0.0); // Start from the right
            const end = Offset.zero; // End at the center
            const curve = Curves.linear; // Linear curve for smooth transition

            var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
          transitionDuration:
          const Duration(milliseconds: 400), // Set transition duration to 400ms
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is GetProfileSuccess) {
          NavigationUtil.navigateTo(context, screen: HomeLayout());
        } else if (state is AuthFailure) {
          NavigationUtil.navigateTo(context, screen: const LoginScreen());
        }
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.splashScreen,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.logo),

              SizedBox(height: responsive(context, 3)),

              Text(
                'Vica Hotel',
                style: TextStyle(
                  // fontFamily: 'Poppins',
                    fontFamily: 'Raleway',
                    fontSize: responsive(context, 15),
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: responsive(context, 1),
                    letterSpacing: 0
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
