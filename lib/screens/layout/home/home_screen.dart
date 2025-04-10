import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vica_hotel_app/providers/room_provider.dart';
import 'package:vica_hotel_app/providers/room_state.dart';
import 'package:vica_hotel_app/utils/images.dart';
import 'package:vica_hotel_app/widgets/app_bar.dart';
import 'package:vica_hotel_app/widgets/rooms_slider.dart';
import 'package:vica_hotel_app/widgets/search_field.dart';
import 'package:vica_hotel_app/widgets/titles_slider.dart';
import 'package:vica_hotel_app/widgets/welcome_dialog.dart';
import '../../../utils/colors.dart';
import '../../../utils/responsive_util.dart';
import '../../../widgets/poppins_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, this.onSearch});

  final TextEditingController searchController = TextEditingController();
  final VoidCallback? onSearch;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: appBar(context),
        body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: responsive(context, 16)),
                child: SearchField(controller: searchController),
              ),

              // Image with text and button
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: responsive(context, 16)),
                child: welcomeWidget(context,
                    imagePath: AppImages.welcomeImage,
                    title: locale.welcome_card_title,
                    buttonText: locale.book_now),
              ),

              // Center Text with "View All" in the right
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: responsive(context, 16),
                    vertical: responsive(context, 18)),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    GestureDetector(
                        child: PoppinsText.medium(locale.view_all,
                            fontSize: responsive(context, 10),
                            color: AppColors.redColor)),
                    Center(
                        child: PoppinsText.medium(locale.choose_a_room,
                            fontSize: responsive(context, 20),
                            color: AppColors.primary)),
                  ],
                ),
              ),

              // Titles slider
              titlesSlider(context),
              SizedBox(height: responsive(context, 16)),

              // Vertical room cards
              // Horizontal room slider
              BlocBuilder<RoomCubit, RoomState>(
                builder: (context, state) {
                  if (state is RoomLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is RoomLoaded && state.rooms.isEmpty) {
                    return const Center(child: Text('No rooms available'));
                  } else if (state is RoomError) {
                    return Center(child: Text(state.message));
                  } else if (state is RoomLoaded) {
                    return roomsSlider(context, rooms: state.rooms);
                  }
                  return const Center(child: Text("No rooms available"));
                },
              ),
            ])));
  }
}
