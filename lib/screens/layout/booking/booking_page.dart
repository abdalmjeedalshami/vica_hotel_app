import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vica_hotel_app/providers/room_provider.dart';
import 'package:vica_hotel_app/providers/room_state.dart';
import 'package:vica_hotel_app/screens/room_page/room_page.dart';
import 'package:vica_hotel_app/utils/navigation_util.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/utils/theme/app_theme.dart';
import 'package:vica_hotel_app/widgets/active_tab.dart';
import 'package:vica_hotel_app/widgets/app_bar.dart';
import '../../../models/room_model.dart';
import '../../../widgets/booking_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    List<Room> bookedList = context.read<RoomCubit>().booked;
    List<Room> pastList = context.read<RoomCubit>().past;
    List<Room> rooms = _selectedTab == 0 ? bookedList : pastList;
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [
          // Toggle Section: Active & Past
          Padding(
              padding: EdgeInsets.all(responsive(context, 16)),
              child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).toggleBookingButton,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsetsDirectional.all(responsive(context, 2)),
                  child: Row(children: [
                    // Active Toggle
                    ToggleButton(
                        text: locale.active,
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
                        text: locale.past,
                        onTap: () {
                          setState(() {
                            _selectedTab = 1;
                          });
                        }),
                  ]))),
          // List of Booking Items
          Expanded(
            child: BlocBuilder<RoomCubit, RoomState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: rooms.length,
                  itemBuilder: (context, index) {
                    final room = rooms[index];
                    return GestureDetector(
                        onTap: () {
                          NavigationUtil.navigateTo(context,
                              screen: RoomPage(room: room), withRoute: true);
                        },
                        child: BookingRoomCard(room: room));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
