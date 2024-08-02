import 'package:book_app_clean_architecture/core/errors/error.dart';
import 'package:book_app_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Errors, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Errors, List<BookEntity>>> fetchNewestBooks();
}
