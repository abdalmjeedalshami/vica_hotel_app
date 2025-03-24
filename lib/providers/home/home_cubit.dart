import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentIndex = 0;

  void changeSelectedIndex(int newIndex) {
    currentIndex = newIndex;
    emit(ChangeIndex());
  }
}
