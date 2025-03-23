import 'package:flutter/material.dart';
import 'package:vica_hotel_app/utils/images.dart';
import 'package:vica_hotel_app/widgets/app_bar.dart';
import 'package:vica_hotel_app/widgets/rooms_slider.dart';
import 'package:vica_hotel_app/widgets/search_field.dart';
import 'package:vica_hotel_app/widgets/titles_slider.dart';
import 'package:vica_hotel_app/widgets/welcome_dialog.dart';
import '../../../utils/colors.dart';
import '../../../utils/responsive_util.dart';
import '../../../widgets/poppins_text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, this.onSearch});

  final TextEditingController searchController = TextEditingController();
  final VoidCallback? onSearch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: responsive(context, 16),
                    vertical: responsive(context, 8)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchField(controller: searchController),

                      // Image with text and button
                      welcomeWidget(context,
                          imagePath: AppImages.welcomeImage,
                          title: 'A Hotel for every moment rich in emotion.',
                          buttonText: 'Book now'),

                      // Center Text with "View All" in the right
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: responsive(context, 18)),
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            GestureDetector(
                                child: PoppinsText.medium('view all',
                                    fontSize: responsive(context, 10),
                                    color: AppColors.redColor)),
                            Center(
                                child: PoppinsText.medium('Choose a room',
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
                      roomsSlider(context)
                    ]))));
  }
}
