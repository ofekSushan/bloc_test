import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test/globals/enum/enum.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivitySubscription;
  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    connectivity.onConnectivityChanged.listen(
      (Result) {
        if (Result == ConnectionTypes.wifi) {
          ConnectToInternet(ConnectionTypes.wifi);
        } else if (Result == ConnectionTypes.mobile) {
          ConnectToInternet(ConnectionTypes.mobile);
        } else if (Result == ConnectionTypes.noConnection) {
          ConnectToInternet(ConnectionTypes.noConnection);
        } else {
          return ConnectToInternet(ConnectionTypes.cantread);
        }
      },
    );
  }

  void ConnectToInternet(ConnectionTypes Type) =>
      emit(InternetConnection(type: Type));

  Future<void> close() {
    connectivitySubscription!.cancel();
    return super.close();
  }
}
