import 'package:flutter/material.dart';
import 'package:vica_hotel_app/screens/layout/account/account_page.dart';
import 'package:vica_hotel_app/screens/layout/booking/booking_page.dart';
import 'package:vica_hotel_app/screens/layout/home/home_screen.dart';
import 'package:vica_hotel_app/screens/layout/rooms/rooms_page.dart';
import 'package:vica_hotel_app/utils/colors.dart';
import 'package:vica_hotel_app/utils/icons.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/utils/theme/app_theme.dart';

class HomeLayout extends StatefulWidget {
  final int index;

  const HomeLayout({Key? key, required this.index}) : super (key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late int _currentIndex;

  final List<Widget> screens = [
    HomeScreen(),
    const BookingScreen(),
    const RoomsScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (newIndex) {setState(() {
            _currentIndex = newIndex;
          });},
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
                  _currentIndex == 0 ? AppColors.primary : Theme.of(context).unselectedItemColor),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.booking,
                  color:
                  _currentIndex == 1 ? AppColors.primary : Theme.of(context).unselectedItemColor),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.rooms,
                  color:
                  _currentIndex == 2 ? AppColors.primary : Theme.of(context).unselectedItemColor),
              label: 'Rooms',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.person,
                  color:
                  _currentIndex == 3 ? AppColors.primary : Theme.of(context).unselectedItemColor),
              label: 'Account',
            ),
          ],
        ));
  }
}