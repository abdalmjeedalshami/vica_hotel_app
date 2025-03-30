import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vica_hotel_app/providers/room_provider.dart';
import '../providers/home/home_cubit.dart';
import '../providers/main/main_cubit.dart';
import '../providers/main/main_state.dart';
import '../services/database_helper.dart';
import '../utils/images.dart';
import '../utils/responsive_util.dart';


AppBar appBar(context) => AppBar(
      elevation: 0,
      leading: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          MainCubit mainCubit = context.read<MainCubit>();
          return IconButton(
            onPressed: () {
              mainCubit.toggleTheme();
            },
            icon: Icon(mainCubit.isLightTheme
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined),
          );
        },
      ),
      actions: [
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                // await DatabaseHelper.getRoomsByStatus();
                // context.read<RoomCubit>().deleteDatabaseFile();
                // context.read<RoomCubit>()
                // await DatabaseHelper.deleteRooms();
                // await DatabaseHelper.deleteDatabaseFile();
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                context
                    .read<RoomCubit>()
                    .addSampleRooms(DatabaseHelper.instance);
              },
            ),
            IconButton(
              icon: const Icon(Icons.print),
              onPressed: () async {
                await DatabaseHelper.getRoomsByStatus();
              },
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: responsive(context, 16)),
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<HomeCubit>(context).changeSelectedIndex(3);
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage(AppImages.userBig),
              // User image
              radius: 20,
            ),
          ),
        ),
      ],
    );
