import 'package:flutter/material.dart';
import 'package:vica_hotel_app/widgets/app_bar.dart';
import 'package:vica_hotel_app/widgets/rooms_slider.dart';
import 'package:vica_hotel_app/widgets/search_field.dart';
import 'package:vica_hotel_app/widgets/titles_slider.dart';
import '../../../utils/colors.dart';
import '../../../utils/responsive_util.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({super.key});

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  late ScrollController scrollController;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      double initialPosition = 20 * 2;
      scrollController.jumpTo(initialPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: responsive(context, 16),
              vertical: responsive(context, 8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchField(controller: searchController),

              // Titles slider
              titlesSlider(context, selectedColor: AppColors.earthyBrown),
              SizedBox(height: responsive(context, 16)),

              // Horizontal room slider of vertical room cards
              roomsSlider(context),
              SizedBox(height: responsive(context, 3)),
              roomsSlider(context, controller: scrollController)
            ],
          ),
        ),
      ),
    );
  }
}
