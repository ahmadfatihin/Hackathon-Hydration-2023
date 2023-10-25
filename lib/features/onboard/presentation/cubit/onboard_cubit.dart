import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'onboard_state.dart';
part 'onboard_cubit.freezed.dart';

@singleton
class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit() : super(const OnboardState.initial());
}
