import 'package:dartz/dartz.dart';

abstract class UseCase<type, Param> {
  const UseCase();
  Future<Either<Error, type>> call({Param param});
}

class NoParam {}
