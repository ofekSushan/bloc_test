import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test/globals/enum/enum.dart';
import 'package:meta/meta.dart';

import 'internet_cubit.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  StreamSubscription? connectivitySubscription;

  CounterCubit({
    required this.internetCubit,
  }) : super(CounterState(counterValue: 0)) {
    connectivitySubscription = internetCubit.stream.listen((InternetState) {
      if (InternetState is InternetConnection &&
          InternetState != ConnectionTypes.noConnection) {
        add();
      }
    });
  }

  void add() => emit(
        CounterState(counterValue: state.counterValue + 1, Isadded: true),
      );

  void remove() =>
      emit(CounterState(counterValue: state.counterValue - 1, Isadded: false));

  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
