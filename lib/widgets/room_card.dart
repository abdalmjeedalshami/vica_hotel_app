import 'package:flutter/material.dart';
import 'package:vica_hotel_app/utils/colors.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/utils/theme/app_theme.dart';
import 'package:vica_hotel_app/widgets/poppins_text.dart';

class RoomCard extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  final String roomName;
  final double rating;
  final double price;
  final List<Map<String, dynamic>>
      featuresIcons; // List containing icon paths and availability

  const RoomCard({
    super.key,
    required this.onTap,
    required this.imagePath,
    required this.roomName,
    required this.rating,
    required this.price,
    required this.featuresIcons,
    required bool
        isAvailable, // Example: [{'iconPath': 'assets/icons/wifi.png', 'available': true}]
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: responsive(context, 250),
        child: Card(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              // Image and Overlay with Opacity
              Image.asset(
                imagePath,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                height: responsive(context, 120),
                color: AppColors.charcoalGray.withOpacity(.4),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: responsive(context, 12),
                      top: responsive(context, 12),
                      right: responsive(context, 5),
                      bottom: responsive(context, 12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Room Name & Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Room name
                          Expanded(
                            child: PoppinsText.semiBold(roomName,
                                fontSize: responsive(context, 18),
                                color: AppColors.white),
                          ),
                          // Stars Rating
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                index < rating ? Icons.star : Icons.star_border,
                                color: Colors.orange,
                                size: responsive(context, 8),
                              );
                            }),
                          ),
                        ],
                      ),
                      // Price
                      PoppinsText.medium('\$$price/night',
                          fontSize: responsive(context, 15),
                          color: AppColors.white),
                      // Features Icons & Available
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: featuresIcons.map((feature) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    right: responsive(context, 8)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).featureIconBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    feature['iconPath'],
                                    width: responsive(context, 20),
                                    height: responsive(context, 20),
                                    color: feature['available']
                                        ? Colors.blue // Blue for available
                                        : Colors.grey, // Gray for unavailable
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          PoppinsText.semiBold('Available',
                              fontSize: responsive(context, 10),
                              color: AppColors.white),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
