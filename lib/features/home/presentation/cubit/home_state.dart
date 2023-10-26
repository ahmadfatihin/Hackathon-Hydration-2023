part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial(
      {@Default('') String name,
      required bool rain,
      required bool doneForToday,
      required double drinks,
      required double grassGreen}) = _Initial;
}
