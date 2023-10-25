// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/login/presentation/cubit/login_cubit.dart' as _i4;
import '../../features/onboard/presentation/cubit/onboard_cubit.dart' as _i5;
import 'register_module.dart' as _i6;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i3.Box<dynamic>>(
    () => registerModule.hive,
    preResolve: true,
  );
  gh.factory<_i4.LoginCubit>(() => _i4.LoginCubit());
  gh.singleton<_i5.OnboardCubit>(_i5.OnboardCubit());
  return getIt;
}

class _$RegisterModule extends _i6.RegisterModule {}
