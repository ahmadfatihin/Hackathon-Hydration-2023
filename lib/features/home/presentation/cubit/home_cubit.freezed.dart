// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  String get name => throw _privateConstructorUsedError;
  bool get rain => throw _privateConstructorUsedError;
  bool get doneForToday => throw _privateConstructorUsedError;
  double get drinks => throw _privateConstructorUsedError;
  double get grassGreen => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, bool rain, bool doneForToday,
            double drinks, double grassGreen)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, bool rain, bool doneForToday, double drinks,
            double grassGreen)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, bool rain, bool doneForToday, double drinks,
            double grassGreen)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {String name,
      bool rain,
      bool doneForToday,
      double drinks,
      double grassGreen});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? rain = null,
    Object? doneForToday = null,
    Object? drinks = null,
    Object? grassGreen = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rain: null == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as bool,
      doneForToday: null == doneForToday
          ? _value.doneForToday
          : doneForToday // ignore: cast_nullable_to_non_nullable
              as bool,
      drinks: null == drinks
          ? _value.drinks
          : drinks // ignore: cast_nullable_to_non_nullable
              as double,
      grassGreen: null == grassGreen
          ? _value.grassGreen
          : grassGreen // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      bool rain,
      bool doneForToday,
      double drinks,
      double grassGreen});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? rain = null,
    Object? doneForToday = null,
    Object? drinks = null,
    Object? grassGreen = null,
  }) {
    return _then(_$InitialImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rain: null == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as bool,
      doneForToday: null == doneForToday
          ? _value.doneForToday
          : doneForToday // ignore: cast_nullable_to_non_nullable
              as bool,
      drinks: null == drinks
          ? _value.drinks
          : drinks // ignore: cast_nullable_to_non_nullable
              as double,
      grassGreen: null == grassGreen
          ? _value.grassGreen
          : grassGreen // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.name = '',
      required this.rain,
      required this.doneForToday,
      required this.drinks,
      required this.grassGreen});

  @override
  @JsonKey()
  final String name;
  @override
  final bool rain;
  @override
  final bool doneForToday;
  @override
  final double drinks;
  @override
  final double grassGreen;

  @override
  String toString() {
    return 'HomeState.initial(name: $name, rain: $rain, doneForToday: $doneForToday, drinks: $drinks, grassGreen: $grassGreen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rain, rain) || other.rain == rain) &&
            (identical(other.doneForToday, doneForToday) ||
                other.doneForToday == doneForToday) &&
            (identical(other.drinks, drinks) || other.drinks == drinks) &&
            (identical(other.grassGreen, grassGreen) ||
                other.grassGreen == grassGreen));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, rain, doneForToday, drinks, grassGreen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, bool rain, bool doneForToday,
            double drinks, double grassGreen)
        initial,
  }) {
    return initial(name, rain, doneForToday, drinks, grassGreen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, bool rain, bool doneForToday, double drinks,
            double grassGreen)?
        initial,
  }) {
    return initial?.call(name, rain, doneForToday, drinks, grassGreen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, bool rain, bool doneForToday, double drinks,
            double grassGreen)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(name, rain, doneForToday, drinks, grassGreen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial(
      {final String name,
      required final bool rain,
      required final bool doneForToday,
      required final double drinks,
      required final double grassGreen}) = _$InitialImpl;

  @override
  String get name;
  @override
  bool get rain;
  @override
  bool get doneForToday;
  @override
  double get drinks;
  @override
  double get grassGreen;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
