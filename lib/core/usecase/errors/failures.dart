import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NullParamFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
