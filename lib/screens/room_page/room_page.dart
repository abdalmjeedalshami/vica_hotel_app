import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vica_hotel_app/providers/room_provider.dart';
import 'package:vica_hotel_app/providers/room_state.dart';
import 'package:vica_hotel_app/services/database_helper.dart';
import 'package:vica_hotel_app/utils/colors.dart';
import 'package:vica_hotel_app/utils/navigation_util.dart';
import 'package:vica_hotel_app/utils/theme/app_theme.dart';
import '../../models/room_model.dart';
import '../../utils/icons.dart';
import '../../utils/responsive_util.dart';
import '../../widgets/poppins_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoomPage extends StatelessWidget {
  final Room room;

  const RoomPage(
      {super.key,
      required this.room}); // List containing icon paths and availability

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

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
                      image: AssetImage(room.image), fit: BoxFit.cover),
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
                              child: PoppinsText.semiBold(room.name,
                                  fontSize: responsive(context, 25),
                                  color: AppColors.white),
                            ),
                            // Stars Rating
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < room.rate
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
                            PoppinsText.medium(
                                '\$${room.price.toStringAsFixed(2)}/${locale.night}',
                                fontSize: responsive(context, 18),
                                color: AppColors.white),
                            PoppinsText.semiBold(
                                room.available ? locale.available : locale.unavailable,
                                fontSize: responsive(context, 10),
                                color: room.available
                                    ? AppColors.white
                                    : AppColors.redColor),
                          ],
                        ),
                        // Features Icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
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
                                      padding: EdgeInsets.all(
                                          responsive(context, 12)),
                                      child: SvgPicture.asset(
                                        AppIcons.tv,
                                        height: responsive(context, 25),
                                        width: responsive(context, 25),
                                        colorFilter: ColorFilter.mode(
                                            room.tv ? Colors.blue : Colors.grey,
                                            BlendMode.srcIn),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: responsive(context, 5)),
                                  PoppinsText.medium('TV',
                                      fontSize: responsive(context, 8),
                                      color: AppColors.white)
                                ],
                              ),
                            ),
                            Padding(
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
                                      padding: EdgeInsets.all(
                                          responsive(context, 12)),
                                      child: SvgPicture.asset(
                                        AppIcons.shower,
                                        height: responsive(context, 25),
                                        width: responsive(context, 25),
                                        colorFilter: ColorFilter.mode(
                                            room.shower
                                                ? Colors.blue
                                                : Colors.grey,
                                            BlendMode.srcIn),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: responsive(context, 5)),
                                  PoppinsText.medium('Shower',
                                      fontSize: responsive(context, 8),
                                      color: AppColors.white)
                                ],
                              ),
                            ),
                            Padding(
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
                                      padding: EdgeInsets.all(
                                          responsive(context, 12)),
                                      child: SvgPicture.asset(
                                        AppIcons.wifi,
                                        height: responsive(context, 25),
                                        width: responsive(context, 25),
                                        colorFilter: ColorFilter.mode(
                                            room.wifi
                                                ? Colors.blue
                                                : Colors.grey,
                                            BlendMode.srcIn),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: responsive(context, 5)),
                                  PoppinsText.medium('Wifi',
                                      fontSize: responsive(context, 8),
                                      color: AppColors.white)
                                ],
                              ),
                            ),
                            Padding(
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
                                      padding: EdgeInsets.all(
                                          responsive(context, 12)),
                                      child: SvgPicture.asset(
                                        AppIcons.breakfast,
                                        height: responsive(context, 25),
                                        width: responsive(context, 25),
                                        colorFilter: ColorFilter.mode(
                                            room.breakfast
                                                ? Colors.blue
                                                : Colors.grey,
                                            BlendMode.srcIn),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: responsive(context, 5)),
                                  PoppinsText.medium('Breakfast',
                                      fontSize: responsive(context, 8),
                                      color: AppColors.white)
                                ],
                              ),
                            ),
                          ],
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
                PoppinsText.regular(room.description,
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
              itemCount: room.images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Container(
                  height: double.infinity,
                  width: responsive(context, 130),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(room.images[index]),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
          BlocBuilder<RoomCubit, RoomState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: responsive(context, 16),
                    vertical: responsive(context, 33)),
                child: SizedBox(
                  width: double.infinity,
                  height: responsive(context, 55),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      backgroundColor: room.available
                          ? Theme.of(context).primaryColor
                          : AppColors.darkGray_1,
                      foregroundColor:
                          room.available ? AppColors.white : AppColors.white,
                    ),
                    onPressed: () {
                      DatabaseHelper.updateRoomStatus(
                          id: room.id!,
                          status:
                              room.status == 'booked' ? locale.available : 'booked').then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(room.status == 'booked' ? 'Booked canceled' : 'Room booked')));
                        NavigationUtil.popScreen(context);
                                context.read<RoomCubit>().fetchRooms();
                      });
                    },
                    child: Text(
                      room.status == 'booked' ? locale.cancel : locale.book_now,
                      style: const TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
