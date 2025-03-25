import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vica_hotel_app/utils/colors.dart';
import 'package:vica_hotel_app/utils/images.dart';
import 'package:vica_hotel_app/utils/theme/app_theme.dart';
import 'package:vica_hotel_app/widgets/custom_button.dart';
import '../../utils/icons.dart';
import '../../utils/responsive_util.dart';
import '../../widgets/poppins_text.dart';

class RoomPage extends StatelessWidget {
  final String imagePath;
  final String roomName;
  final double rating;
  final double price;
  final List<Map<String, dynamic>> featuresIcons;

  const RoomPage({
    super.key,
    required this.imagePath,
    required this.roomName,
    required this.rating,
    required this.price,
    required this.featuresIcons,
    required bool
        isAvailable, // Example: [{'iconPath': 'assets/icons/wifi.png', 'available': true}]
  }); // List containing icon paths and availability

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Image
              Container(
                height: responsive(context, 450),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imagePath), fit: BoxFit.cover),
                ),
              ),
              // Filter
              Container(
                height: responsive(context, 450),
                color: AppColors.transparentCharcoal,
                child: const Stack(),
              ),
              // Back & Fav
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: responsive(context, 16),
                    vertical: responsive(context, 25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Container(
                        height: responsive(context, 30),
                        width: responsive(context, 30),
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(responsive(context, 8)),
                          child: SvgPicture.asset(
                            AppIcons.backArrow,
                            width: responsive(context, 10),
                            height: responsive(context, 10),
                            colorFilter: const ColorFilter.mode(
                                AppColors.darkGray_1, BlendMode.srcIn),
                          ),
                        ),
                        // child: Image.asset(
                        //   AppIcons.backArrow,
                        //   color: AppColors.darkGray_1,
                        // )
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Container(
                          height: responsive(context, 30),
                          width: responsive(context, 30),
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: AppColors.redColor,
                          )),
                    )
                  ],
                ),
              ),
              // info
              Container(
                margin:
                    EdgeInsetsDirectional.only(top: responsive(context, 250)),
                height: responsive(context, 200),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: responsive(context, 12),
                      top: responsive(context, 12),
                      right: responsive(context, 5),
                      bottom: responsive(context, 12)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: responsive(context, 25)),
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
                                  fontSize: responsive(context, 25),
                                  color: AppColors.white),
                            ),
                            // Stars Rating
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < rating
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.orange,
                                  size: responsive(context, 11),
                                );
                              }),
                            ),
                          ],
                        ),
                        // Price & Available
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PoppinsText.medium('\$$price/night',
                                fontSize: responsive(context, 18),
                                color: AppColors.white),
                            PoppinsText.semiBold('Available',
                                fontSize: responsive(context, 10),
                                color: AppColors.white),
                          ],
                        ),
                        // Features Icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: featuresIcons.map((feature) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: responsive(context, 8)),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: AppColors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(responsive(context, 12)),
                                      child: SvgPicture.asset(
                                        feature['iconPath'],
                                        height: responsive(context, 25),
                                        width: responsive(context, 25),
                                        colorFilter: ColorFilter.mode(
                                            feature['available']
                                                ? Colors.blue
                                                : Colors.grey,
                                            BlendMode.srcIn),
                                      ),
                                    ),
                                    // child: Image.asset(
                                    //   feature['iconPath'],
                                    //   width: responsive(context, 57),
                                    //   height: responsive(context, 57),
                                    //   color: feature['available']
                                    //       ? Colors.blue // Blue for available
                                    //       : Colors.grey, // Gray for unavailable
                                    // ),
                                  ),
                                  SizedBox(height: responsive(context, 5)),
                                  PoppinsText.medium(feature['featureName'],
                                      fontSize: responsive(context, 8),
                                      color: AppColors.white)
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: responsive(context, 16),
                vertical: responsive(context, 12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                PoppinsText.semiBold(
                  'Room Specifications',
                  color: Theme.of(context).socialLoginButtonColor,
                ),
                // Description
                PoppinsText.regular(
                    'The elegant luxury bedrooms in this gallery showcase custom interior designs & decorating ideas. View pictures and find your perfect luxury bedroom design.',
                    fontSize: responsive(context, 13),
                    color: Theme.of(context).customTextFieldIconColor,
                    overflow: TextOverflow.visible),
              ],
            ),
          )),
          // Photos
          SizedBox(
            height: responsive(context, 130),
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Container(
                  height: double.infinity,
                  width: responsive(context, 130),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage(AppImages.room_1),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: responsive(context, 16),
                vertical: responsive(context, 33)),
            child: const CustomButton(text: 'Book room'),
          )
        ],
      ),
    );
  }
}
