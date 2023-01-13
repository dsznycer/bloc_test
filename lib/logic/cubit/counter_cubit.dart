import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_bloc_app/constants/enums.dart';
import 'package:test_bloc_app/logic/cubit/internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends HydratedCubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, isIncremented: true));
  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, isIncremented: false));

  void zeroShit() => emit(CounterState(counterValue: state.counterValue = 0));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
