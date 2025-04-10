import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vica_hotel_app/l10n/l10n.dart';
import 'package:vica_hotel_app/providers/auth/auth_cubit.dart';
import 'package:vica_hotel_app/providers/home/home_cubit.dart';
import 'package:vica_hotel_app/providers/main/main_cubit.dart';
import 'package:vica_hotel_app/providers/main/main_state.dart';
import 'package:vica_hotel_app/providers/room_provider.dart';
import 'package:vica_hotel_app/screens/flash_screen.dart';
import 'package:vica_hotel_app/services/auth_service.dart';
import 'package:vica_hotel_app/services/database_helper.dart';
import 'package:vica_hotel_app/utils/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Add sample rooms
  // addSampleRooms(databaseHelper);

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
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => AuthCubit(AuthService())),
        BlocProvider(create: (_) => RoomCubit(DatabaseHelper.instance)..fetchRooms()..addSampleRooms(DatabaseHelper.instance))
      ],
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          MainCubit mainCubit = context.read<MainCubit>();
          return MaterialApp(
            locale: mainCubit.currentLocale,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
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
