import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vica_hotel_app/providers/auth/auth_cubit.dart';
import 'package:vica_hotel_app/providers/auth/auth_state.dart';
import 'package:vica_hotel_app/providers/room_provider.dart';
import '../providers/home/home_cubit.dart';
import '../providers/main/main_cubit.dart';
import '../providers/main/main_state.dart';
import '../services/database_helper.dart';
import '../utils/images.dart';
import '../utils/responsive_util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppBar appBar(context) => AppBar(
      elevation: 0,
      leading: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          MainCubit mainCubit = context.read<MainCubit>();
          return IconButton(
            tooltip: 'toggle theme',
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
        BlocBuilder<MainCubit, MainState>(
  builder: (context, state) {
    MainCubit mainCubit = context.read<MainCubit>();
    return IconButton(
          icon: const Icon(Icons.language),
          tooltip: AppLocalizations.of(context)!.email,
          onPressed: () {
            mainCubit.toggleLanguage();
          },
        );
  },
),

        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () async {
            context
                .read<RoomCubit>()
                .addSampleRooms(DatabaseHelper.instance);
          },
          tooltip: 'add some rooms',
        ),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(right: responsive(context, 16)),
              child: GestureDetector(
                onTap: () {
                  BlocProvider.of<HomeCubit>(context).changeSelectedIndex(3);
                },
                child: CircleAvatar(
                  backgroundImage:
                      context.read<AuthCubit>().profileImagePath.isEmpty
                          ? const AssetImage(AppImages.userBig)
                          : FileImage(File(context.read<AuthCubit>().profileImagePath)) as ImageProvider,
                  // User image
                  radius: 20,
                ),
              ),
            );
          },
        ),
      ],
    );
