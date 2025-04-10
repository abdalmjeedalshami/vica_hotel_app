import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitialState());

  bool isLightTheme = true;
  Locale currentLocale = const Locale('en');

  void toggleTheme() {
    isLightTheme = !isLightTheme;
    emit(ToggleTheme());
  }

  void toggleLanguage() {
    currentLocale = currentLocale.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');
    emit(ToggleLanguage());
  }
}

