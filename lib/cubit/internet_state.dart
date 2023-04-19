part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}

class InternetLoading extends InternetState {}

class InternetConnection extends InternetState {
  final ConnectionTypes type;

  InternetConnection({
    required this.type,
  });
}
