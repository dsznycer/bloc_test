import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_bloc_app/constants/enums.dart';
import 'package:test_bloc_app/logic/cubit/internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;

  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0)) {
    monitorInternetConnection();
  }

  StreamSubscription<InternetState> monitorInternetConnection() {
    return internetStreamSubscription =
        internetCubit.stream.listen((InternetState) {
      if (InternetState is InternetConnected &&
          InternetState.connectionType == ConnectionType.wifi) {
        increment();
      } else if (InternetState is InternetConnected &&
          InternetState.connectionType == ConnectionType.mobile) {
        increment();
      } else if (InternetState is InternetDisconnected) {
        decrement();
      }
    });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, isIncremented: true));
  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, isIncremented: false));

  void zeroShit() => emit(CounterState(counterValue: state.counterValue = 0));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
