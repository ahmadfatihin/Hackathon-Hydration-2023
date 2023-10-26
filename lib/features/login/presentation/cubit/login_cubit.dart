import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_hydration/features/login/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constant/local_storage_key.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/storage/hive_service.dart';
part 'login_state.dart';
part 'login_cubit.freezed.dart';

@singleton
class LoginCubit extends Cubit<LoginState> {
  final HiveService _hiveService;
  LoginCubit({
    required HiveService hiveService,
  })  : _hiveService = hiveService,
        super(const LoginState.initial());

  Future<void> saveUserData({required UserData userData}) async {
    try {
      final data = userData.toJson().toString();
      await _hiveService.put(LocalStorageKey.userData, data);
      log(data.toString());
      emit(const LoginState.success());
    } catch (e) {
      throw LocalStorageException(message: e.toString());
    }
  }

  Future<void> getUserData() async {
    try {
      final String? userDataString =
          await _hiveService.get(LocalStorageKey.userData);
      if (userDataString != null) {
        final userData = UserDataExtensions.fromString(userDataString);
        emit(LoginState.loaded(userData: userData));
      }
    } catch (e) {
      throw LocalStorageException(message: e.toString());
    }
  }
}
