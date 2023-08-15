import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // final List properties;
  const Failure([List properties = const <dynamic>[]]);

  // @override
  // List<Object> get props => [properties];

  //
}

class ServerFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CacheFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
