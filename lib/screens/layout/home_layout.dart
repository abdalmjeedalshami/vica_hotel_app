import 'package:flutter/material.dart';
import 'package:vica_hotel_app/screens/layout/account/acount_page.dart';
import 'package:vica_hotel_app/screens/layout/booking/booking_page.dart';
import 'package:vica_hotel_app/screens/layout/home/home_screen.dart';
import 'package:vica_hotel_app/screens/layout/rooms/rooms_page.dart';
import 'package:vica_hotel_app/utils/colors.dart';
import 'package:vica_hotel_app/utils/icons.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  HomeLayoutState createState() => HomeLayoutState();
}

class HomeLayoutState extends State<HomeLayout> {
  int _selectedIndex = 0;

  // Bottom navigation options
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> screens = [
     HomeScreen(),
    const BookingScreen(),
    const RoomsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontFamily: 'Poppins', fontSize: responsive(context, 10), fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(fontFamily: 'Poppins', fontSize: responsive(context, 10), fontWeight: FontWeight.w500),
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.darkTransparentBlack,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.home,
                  color:
                      _selectedIndex == 0 ? Colors.blueAccent : Colors.black),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.booking,
                  color:
                      _selectedIndex == 1 ? Colors.blueAccent : Colors.black),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.rooms,
                  color:
                      _selectedIndex == 2 ? Colors.blueAccent : Colors.black),
              label: 'Rooms',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.person,
                  color:
                      _selectedIndex == 3 ? Colors.blueAccent : Colors.black),
              label: 'Account',
            ),
          ],
        ));
  }
}
