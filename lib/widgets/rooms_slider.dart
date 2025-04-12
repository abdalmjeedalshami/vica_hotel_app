import 'package:flutter/material.dart';
import 'package:vica_hotel_app/models/room_model.dart';
import 'package:vica_hotel_app/screens/room_page/room_page.dart';
import 'package:vica_hotel_app/utils/navigation_util.dart';
import 'package:vica_hotel_app/widgets/room_card.dart';
import '../utils/responsive_util.dart';

Widget roomsSlider(context,
        {required List<Room> rooms, ScrollController? controller}) =>
    SizedBox(
      height: responsive(context, 350),
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          final room = rooms[index];
          return Padding(
            padding: index == 0
                ? EdgeInsets.only(
                    left: responsive(context, 16),
                    right: responsive(context, 10))
                : EdgeInsets.only(right: responsive(context, 10)),
            child: GestureDetector(
                onTap: () {
                  NavigationUtil.navigateTo(context,
                      screen: RoomPage(room: room), withRoute: true);
                },
                child: RoomCard(room: room)),
          );
        },
      ),
    );
