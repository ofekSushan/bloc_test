import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'english_state.dart';

class EnglishCubit extends Cubit<EnglishState> {
  EnglishCubit() : super(EnglishState(englishValue: "a".codeUnits.first));

  void ChangeLetter(var Letter) => emit(EnglishState(englishValue: Letter));

  void increment() => emit(EnglishState(englishValue: state.englishValue + 1));

  void decrement() => emit(EnglishState(englishValue: state.englishValue - 1));
}
