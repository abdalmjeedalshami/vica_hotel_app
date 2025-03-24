import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vica_hotel_app/screens/layout/account/account_page.dart';
import 'package:vica_hotel_app/screens/layout/booking/booking_page.dart';
import 'package:vica_hotel_app/screens/layout/home/home_screen.dart';
import 'package:vica_hotel_app/screens/layout/rooms/rooms_page.dart';
import 'package:vica_hotel_app/utils/colors.dart';
import 'package:vica_hotel_app/utils/icons.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/utils/theme/app_theme.dart';

import '../../providers/home/home_cubit.dart';
import '../../providers/home/home_state.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);

  final List<Widget> screens = [
    HomeScreen(),
    const BookingScreen(),
    const RoomsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit homeCubit = context.read<HomeCubit>();
        return Scaffold(
            body: screens[homeCubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: homeCubit.currentIndex,
              onTap: (newIndex) {
                homeCubit.changeSelectedIndex(newIndex);
              },
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: responsive(context, 10),
                  fontWeight: FontWeight.w500),
              unselectedLabelStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: responsive(context, 10),
                  fontWeight: FontWeight.w500),
              selectedItemColor: AppColors.primary,
              // unselectedItemColor: AppColors.darkTransparentBlack,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.home,
                      colorFilter: ColorFilter.mode(
                          homeCubit.currentIndex == 0
                              ? AppColors.primary
                              : Theme.of(context).unselectedItemColor,
                          BlendMode.srcIn)),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.booking,
                      colorFilter: ColorFilter.mode(
                          homeCubit.currentIndex == 1
                              ? AppColors.primary
                              : Theme.of(context).unselectedItemColor,
                          BlendMode.srcIn)),
                  label: 'Booking',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.rooms,
                      colorFilter: ColorFilter.mode(
                          homeCubit.currentIndex == 2
                              ? AppColors.primary
                              : Theme.of(context).unselectedItemColor,
                          BlendMode.srcIn)),
                  label: 'Rooms',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.person,
                      colorFilter: ColorFilter.mode(
                          homeCubit.currentIndex == 3
                              ? AppColors.primary
                              : Theme.of(context).unselectedItemColor,
                          BlendMode.srcIn)),
                  label: 'Account',
                )
              ],
            ));
      },
    );
  }
}
