import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseList<Type, Params> {
  Future<Either<Failure, List<Type>>> call(Params params);
}

class Noparams extends Equatable {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
