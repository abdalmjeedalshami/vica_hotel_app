import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vica_hotel_app/utils/icons.dart';
import 'package:vica_hotel_app/utils/theme/app_theme.dart';
import 'package:vica_hotel_app/widgets/poppins_text.dart';
import '../models/room_model.dart';
import '../utils/responsive_util.dart';

/// Custom widget that displays an individual booking item.
class BookingRoomCard extends StatelessWidget {
  final Room room;

  const BookingRoomCard({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Booking Image
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Image.asset(
                room.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            // Booking Details Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hotel name and rating.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: PoppinsText(
                              text: room.name,
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis))),
                      // Star rating
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < room.rate
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.orange,
                            size: responsive(context, 13),
                          );
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: responsive(context, 5)),
                  // Price
                  PoppinsText.medium('\$${room.price.toStringAsFixed(2)}',
                      fontSize: responsive(context, 12),
                      color: Theme.of(context).unselectedItemColor),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Padding(
                          padding:
                          EdgeInsets.only(right: responsive(context, 8)),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).unselectedTitlesSlider,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(AppIcons.tv,
                                      width: 10,
                                      height: 10,
                                      colorFilter: ColorFilter.mode(
                                          room.available
                                              ? Colors.blue
                                              : Colors.grey,
                                          BlendMode.srcIn))))),
                      Padding(
                          padding:
                          EdgeInsets.only(right: responsive(context, 8)),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).unselectedTitlesSlider,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(AppIcons.shower,
                                      width: 10,
                                      height: 10,
                                      colorFilter: ColorFilter.mode(
                                          room.available
                                              ? Colors.blue
                                              : Colors.grey,
                                          BlendMode.srcIn))))),
                      Padding(
                          padding:
                          EdgeInsets.only(right: responsive(context, 8)),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).unselectedTitlesSlider,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(AppIcons.wifi,
                                      width: 10,
                                      height: 10,
                                      colorFilter: ColorFilter.mode(
                                          room.available
                                              ? Colors.blue
                                              : Colors.grey,
                                          BlendMode.srcIn)))))

                    ],
                  ),
                  const SizedBox(height: 8),
                  // Start and End dates
                  const Row(
                    children: [
                      Icon(Icons.calendar_today,
                          size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        '2023-10-10',
                        style:
                            TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '-',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '2023-12-10',
                        style:
                            TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
