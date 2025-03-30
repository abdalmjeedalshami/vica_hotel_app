import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vica_hotel_app/widgets/app_bar.dart';
import 'package:vica_hotel_app/widgets/rooms_slider.dart';
import 'package:vica_hotel_app/widgets/search_field.dart';
import 'package:vica_hotel_app/widgets/titles_slider.dart';
import '../../../providers/room_provider.dart';
import '../../../providers/room_state.dart';
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
          padding: EdgeInsets.only(
              top: responsive(context, 16), bottom: responsive(context, 50)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: responsive(context, 16)),
                child: SearchField(controller: searchController),
              ),

              // Titles slider
              titlesSlider(context, selectedColor: AppColors.earthyBrown),
              SizedBox(height: responsive(context, 16)),

              // Horizontal room slider of vertical room cards
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
              SizedBox(height: responsive(context, 12)),
              BlocBuilder<RoomCubit, RoomState>(
                builder: (context, state) {
                  if (state is RoomLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is RoomLoaded && state.rooms.isEmpty) {
                    return const Center(child: Text('No rooms available'));
                  } else if (state is RoomError) {
                    return Center(child: Text(state.message));
                  } else if (state is RoomLoaded) {
                    return roomsSlider(context, rooms: state.rooms, controller: scrollController);
                  }
                  return const Center(child: Text("No rooms available"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
