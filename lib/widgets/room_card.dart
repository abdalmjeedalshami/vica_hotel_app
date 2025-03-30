import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vica_hotel_app/utils/colors.dart';
import 'package:vica_hotel_app/utils/icons.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/utils/theme/app_theme.dart';
import 'package:vica_hotel_app/widgets/poppins_text.dart';
import '../models/room_model.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({
    super.key,
    required this.room
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: responsive(context, 250),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            // Image and Overlay with Opacity
            Image.asset(
              room.image,
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
                          child: PoppinsText.semiBold(room.name,
                              fontSize: responsive(context, 18),
                              color: AppColors.white),
                        ),
                        // Stars Rating
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < room.rate ? Icons.star : Icons.star_border,
                              color: Colors.orange,
                              size: responsive(context, 8),
                            );
                          }),
                        ),
                      ],
                    ),
                    // Price
                    PoppinsText.medium('\$${room.price.toStringAsFixed(2)}/night',
                        fontSize: responsive(context, 15),
                        color: AppColors.white),
                    // Features Icons & Available
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // TV
                            Padding(
                              padding: EdgeInsets.only(
                                  right: responsive(context, 8)),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                  Theme.of(context).featureIconBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(AppIcons.tv,
                                      width: 10,
                                      height: 10,
                                      colorFilter: ColorFilter.mode(
                                          room.tv
                                              ? Colors.blue
                                              : Colors.grey,
                                          BlendMode.srcIn)),
                                ),
                              ),
                            ),
                            // Shower
                            Padding(
                              padding: EdgeInsets.only(
                                  right: responsive(context, 8)),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                  Theme.of(context).featureIconBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(AppIcons.shower,
                                      width: 10,
                                      height: 10,
                                      colorFilter: ColorFilter.mode(
                                          room.shower
                                              ? Colors.blue
                                              : Colors.grey,
                                          BlendMode.srcIn)),
                                ),
                              ),
                            ),
                            // wifi
                            Padding(
                              padding: EdgeInsets.only(
                                  right: responsive(context, 8)),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                  Theme.of(context).featureIconBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(AppIcons.wifi,
                                      width: 10,
                                      height: 10,
                                      colorFilter: ColorFilter.mode(
                                          room.wifi
                                              ? Colors.blue
                                              : Colors.grey,
                                          BlendMode.srcIn)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        PoppinsText.semiBold(room.available ? 'Available' : 'Unavailable',
                            fontSize: responsive(context, 10),
                            color: room.available ? AppColors.white : AppColors.redColor),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
