import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'testu_state.dart';

class TestuCubit extends HydratedCubit<TestuState> {
  TestuCubit() : super(TestuState('basic'));

  void changeBig() => emit(TestuState('BIGGG'));
  void changeSmall() => emit(TestuState('SMALL'));

  @override
  TestuState? fromJson(Map<String, dynamic> json) {
    return TestuState.fromMap(json);
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(TestuState state) {
    return state.toMap();
    throw UnimplementedError();
  }
}
