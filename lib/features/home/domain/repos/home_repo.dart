import 'package:book_app_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Error, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Error, List<BookEntity>>> fetchNewestBooks();
}
