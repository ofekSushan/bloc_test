import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

import '../globals/enum/enum.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivitySubscription;
  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    connectivity.onConnectivityChanged.listen(
      (Result) {
        if (Result == ConnectionTypes.wifi) {
          print("wifi");

          return ConnectToInternet(ConnectionTypes.wifi);
        } else if (Result == ConnectionTypes.mobile) {
          print("mobile");

          return ConnectToInternet(ConnectionTypes.mobile);
        } else if (Result == ConnectionTypes.noConnection) {
          print("noConnection");

          return ConnectToInternet(ConnectionTypes.noConnection);
        } else {
          print("cantread");

          return ConnectToInternet(ConnectionTypes.cantread);
        }
      },
    );
  }

  void ConnectToInternet(ConnectionTypes Type) =>
      emit(InternetConnection(type: Type));

  Future<void> close() {
    connectivitySubscription.cancel();
    return super.close();
  }
}
