// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'english_cubit.dart';

class EnglishState {
  dynamic englishValue;

  EnglishState({
    required this.englishValue,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'englishValue': englishValue,
    };
  }

  factory EnglishState.fromMap(Map<String, dynamic> map) {
    return EnglishState(
      englishValue: map['englishValue'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory EnglishState.fromJson(String source) =>
      EnglishState.fromMap(json.decode(source) as Map<String, dynamic>);
}
