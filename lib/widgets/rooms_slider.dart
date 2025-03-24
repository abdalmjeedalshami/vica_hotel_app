import 'package:flutter/material.dart';
import 'package:vica_hotel_app/screens/room_page/room_page.dart';
import 'package:vica_hotel_app/utils/navigation_util.dart';
import 'package:vica_hotel_app/widgets/room_card.dart';
import '../utils/icons.dart';
import '../utils/images.dart';
import '../utils/responsive_util.dart';

Widget roomsSlider(context, {ScrollController? controller}) => SizedBox(
      height: responsive(context, 350), // Adjust the height based on card size
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal, // Horizontal scrolling
        itemCount: 5, // Number of room cards
        itemBuilder: (context, index) {
          return Padding(
            padding: index == 0 ? EdgeInsets.only(left: responsive(context, 16), right: responsive(context, 10)) : EdgeInsets.only(right: responsive(context, 10)),
            child: RoomCard(
                onTap: () {
                  NavigationUtil.navigateTo(context,
                      screen: const RoomPage(
                          imagePath: AppImages.room_6,
                          roomName: 'The Royal Room',
                          rating: 5,
                          price: 190,
                          featuresIcons: [
                            {'featureName': '42” television', 'iconPath': AppIcons.tvBig, 'available': true},
                            {'featureName': 'Bath tube', 'iconPath': AppIcons.showerBig, 'available': false},
                            {'featureName': '24H stable wifi', 'iconPath': AppIcons.wifiBig, 'available': true},
                            {'featureName': 'Free Breakfast', 'iconPath': AppIcons.breakfastBig, 'available': true},
                          ],
                          isAvailable: true),
                      withRoute: true);
                },
                imagePath: AppImages.room_6,
                roomName: 'The Royal Room',
                rating: 5,
                price: 190,
                featuresIcons: const [
                  {'iconPath': AppIcons.tv, 'available': true},
                  {'iconPath': AppIcons.shower, 'available': false},
                  {'iconPath': AppIcons.wifi, 'available': true},
                ],
                isAvailable: true),
          );
        },
      ),
    );
