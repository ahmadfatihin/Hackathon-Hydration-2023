import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hackathon_hydration/core/constant/local_storage_key.dart';
import 'package:hackathon_hydration/core/storage/hive_service.dart';
import 'package:hackathon_hydration/features/home/presentation/cubit/drink_record.dart';
import 'package:hackathon_hydration/features/login/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/app_exceptions.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@singleton
class HomeCubit extends Cubit<HomeState> {
  final HiveService _hiveService;
  HomeCubit({
    required HiveService hiveService,
  })  : _hiveService = hiveService,
        super(const HomeState.initial(
            rain: false, doneForToday: false, drinks: 0, grassGreen: 0));

  final int drinkPerDay = 4;

  drink() {
    if (state.drinks < drinkPerDay) {
      emit(HomeState.initial(
          name: state.name,
          rain: state.drinks + 1 == drinkPerDay,
          doneForToday: state.drinks + 1 == drinkPerDay,
          drinks: state.drinks + 1,
          grassGreen: 0));
      _rememberDrinkDoneToday(DateTime.now().day, (state.drinks + 1).toInt());
    }
  }

  reverseWolky() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      emit(HomeState.initial(
          name: state.name,
          rain: true,
          doneForToday: true,
          drinks: state.drinks - 0.1,
          grassGreen: state.grassGreen + 0.2));

      if (state.drinks <= 0) {
        timer.cancel();

        emit(HomeState.initial(
            name: state.name,
            doneForToday: true,
            rain: false,
            drinks: 0,
            grassGreen: state.grassGreen + 0.2));
        debugPrint(state.grassGreen.toString());
      }
    });
  }

  _rememberDrinkDoneToday(int day, int drinkCount) async {
    try {
      await _hiveService.put(LocalStorageKey.drinkRecord,
          DrinkRecord(day: day, drinkCount: drinkCount).toJson());
    } catch (e) {
      throw LocalStorageException(message: e.toString());
    }
  }

  initData() {
    _getUserData();
    _getDrinkStateData();
  }

  _getDrinkStateData() async {
    try {
      final data = await _hiveService.get(LocalStorageKey.drinkRecord);
      final drinkData = DrinkRecord.fromJson(data);
      emit(
        HomeState.initial(
            name: state.name,
            rain: false,
            doneForToday: drinkData.drinkCount == drinkPerDay &&
                drinkData.day == DateTime.now().day,
            drinks:
                drinkData.drinkCount == 4 ? 0 : drinkData.drinkCount.toDouble(),
            grassGreen: drinkData.drinkCount == drinkPerDay &&
                    drinkData.day == DateTime.now().day
                ? 8.2
                : 0),
      );
      debugPrint(state.toString());
    } catch (e) {
      throw LocalStorageException(message: e.toString());
    }
  }

  Future<void> _getUserData() async {
    try {
      final String? userDataString =
          await _hiveService.get(LocalStorageKey.userData);
      if (userDataString != null) {
        final userData = UserDataExtensions.fromString(userDataString);

        emit(HomeState.initial(
            doneForToday: state.doneForToday,
            name: userData.name,
            rain: state.rain,
            drinks: state.drinks,
            grassGreen: state.grassGreen));
      }
    } catch (e) {
      throw LocalStorageException(message: e.toString());
    }
  }
}
