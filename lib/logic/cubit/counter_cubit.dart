import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_bloc_app/constants/enums.dart';
import 'package:test_bloc_app/logic/cubit/internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, isIncremented: true));
  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, isIncremented: false));

  void zeroShit() => emit(CounterState(counterValue: state.counterValue = 0));
}
