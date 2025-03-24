import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  HomeLayout({Key? key}) : super (key: key);

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
          onTap: (newIndex) {homeCubit.changeSelectedIndex(newIndex);},
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontFamily: 'Poppins', fontSize: responsive(context, 10), fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(fontFamily: 'Poppins', fontSize: responsive(context, 10), fontWeight: FontWeight.w500),
          selectedItemColor: AppColors.primary,
          // unselectedItemColor: AppColors.darkTransparentBlack,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.home,
                  color:
                  homeCubit.currentIndex == 0 ? AppColors.primary : Theme.of(context).unselectedItemColor),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.booking,
                  color:
                  homeCubit.currentIndex == 1 ? AppColors.primary : Theme.of(context).unselectedItemColor),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.rooms,
                  color:
                  homeCubit.currentIndex == 2 ? AppColors.primary : Theme.of(context).unselectedItemColor),
              label: 'Rooms',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.person,
                  color:
                  homeCubit.currentIndex == 3 ? AppColors.primary : Theme.of(context).unselectedItemColor),
              label: 'Account',
            ),
          ],
        ));
  },
);
  }
  
}

