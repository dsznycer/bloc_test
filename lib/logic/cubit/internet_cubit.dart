import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:test_bloc_app/constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    connectivityStreamSubscription =
        Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectionType.wifi) {
        emitInternetConnection(ConnectionType.wifi);
      } else if (result == ConnectionType.mobile) {
        emitInternetConnection(ConnectionType.mobile);
      } else if (result == ConnectionType.values) {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnection(ConnectionType _connectiontype) =>
      emit(InternetConnected(connectionType: _connectiontype));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
