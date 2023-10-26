part of 'login_cubit.dart';

enum LoginType { qr, form }

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial({LoginType? loginType}) = _Initial;
  const factory LoginState.loading({LoginType? loginType}) = _Loading;
  const factory LoginState.loaded(
      {required UserData userData, LoginType? loginType}) = _Loaded;
  const factory LoginState.success({LoginType? loginType}) = _Success;
}
