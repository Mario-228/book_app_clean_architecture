import 'package:book_app_clean_architecture/core/errors/error.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<type, Param> {
  const UseCase();
  Future<Either<Errors, type>> call({Param param});
}

class NoParam {}
