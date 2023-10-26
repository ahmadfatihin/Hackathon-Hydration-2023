part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial(
      {required bool rain,
      required double drinks,
      required double grassGreen}) = _Initial;
}
