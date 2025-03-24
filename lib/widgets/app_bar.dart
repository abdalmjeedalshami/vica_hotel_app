import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vica_hotel_app/providers/main/main_state.dart';
import 'package:vica_hotel_app/screens/layout/home_layout.dart';
import 'package:vica_hotel_app/utils/navigation_util.dart';
import '../providers/main/main_cubit.dart';
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
        Padding(
          padding: EdgeInsets.only(right: responsive(context, 16)),
          child: GestureDetector(
            onTap: (){NavigationUtil.navigateTo(context, screen: HomeLayout(index: 3));},
            child: const CircleAvatar(
              backgroundImage: AssetImage(AppImages.user),
              // User image
              radius: 20,
            ),
          ),
        ),
      ],
    );
