import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vica_hotel_app/providers/home/home_cubit.dart';
import 'package:vica_hotel_app/providers/main/main_cubit.dart';
import 'package:vica_hotel_app/providers/main/main_state.dart';
import 'package:vica_hotel_app/screens/flash_screen.dart';
import 'package:vica_hotel_app/utils/theme/app_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MainCubit()),
        BlocProvider(create: (_) => HomeCubit())
      ],
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          MainCubit mainCubit = context.read<MainCubit>();
          return MaterialApp(
            title: 'Flutter Demo',
            theme: mainCubit.isLightTheme ? AppTheme.lightTheme : AppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
