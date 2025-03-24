import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitialState());



  bool isLightTheme = true;

  void toggleTheme() {
    isLightTheme = !isLightTheme;
    emit(ToggleTheme());
  }
}
