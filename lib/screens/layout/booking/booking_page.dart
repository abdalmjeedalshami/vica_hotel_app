import 'package:flutter/material.dart';
import 'package:vica_hotel_app/utils/colors.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/widgets/active_tab.dart';
import 'package:vica_hotel_app/widgets/app_bar.dart';
import '../../../models/booking_item_model.dart';
import '../../../utils/constants.dart';
import '../../../widgets/booking_item.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  BookingScreenState createState() => BookingScreenState();
}

class BookingScreenState extends State<BookingScreen> {
  /// 0: Active bookings, 1: Past bookings.
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    // Choose which list to display based on the toggle state.
    List<BookingItemModel> bookings =
        _selectedTab == 0 ? activeBookings : pastBookings;

    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [
          // Toggle Section: Active & Past
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.softWhite,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsetsDirectional.all(responsive(context, 2)),
                  child: Row(children: [
                    // Active Toggle
                    ToggleButton(
                        isSelected: _selectedTab == 0,
                        onTap: () {
                          setState(() {
                            _selectedTab = 0;
                          });
                        }),
                    SizedBox(width: responsive(context, 5)),
                    // Past Toggle
                    ToggleButton(
                        isSelected: _selectedTab == 1,
                        onTap: () {
                          setState(() {
                            _selectedTab = 1;
                          });
                        }),
                  ]))),
          // List of Booking Items
          Expanded(
            child: ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return BookingItemWidget(booking: booking);
              },
            ),
          ),
        ],
      ),
    );
  }
}