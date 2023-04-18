import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void add() => emit(
        CounterState(counterValue: state.counterValue + 1, Isadded: true),
      );

  void remove() =>
      emit(CounterState(counterValue: state.counterValue - 1, Isadded: false));
}
