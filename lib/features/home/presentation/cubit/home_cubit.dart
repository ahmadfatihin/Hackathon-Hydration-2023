import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@singleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(const HomeState.initial(rain: false, drinks: 0, grassGreen: 0));

  final int drinkPerDay = 4;

  drink() {
    if (state.drinks < drinkPerDay) {
      emit(HomeState.initial(
          rain: state.drinks + 1 == drinkPerDay,
          drinks: state.drinks + 1,
          grassGreen: 0));
    }
  }

  reverseWolky() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      emit(HomeState.initial(
          rain: true,
          drinks: state.drinks - 0.1,
          grassGreen: state.grassGreen + 0.2));

      if (state.drinks <= 0) {
        timer.cancel();
        emit(HomeState.initial(
            rain: false, drinks: 0, grassGreen: state.grassGreen + 0.2));
      }
    });
  }
}
