import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'english_state.dart';

class EnglishCubit extends Cubit<EnglishState> with HydratedMixin {
  EnglishCubit() : super(EnglishState(englishValue: "a".codeUnits.first));

  void ChangeLetter(dynamic Letter) => emit(EnglishState(englishValue: Letter));

  void increment() => emit(EnglishState(englishValue: state.englishValue + 1));

  void decrement() => emit(EnglishState(englishValue: state.englishValue - 1));

  @override
  EnglishState? fromJson(Map<String, dynamic> json) {
    return EnglishState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(EnglishState state) {
    return state.toMap();
  }
}
