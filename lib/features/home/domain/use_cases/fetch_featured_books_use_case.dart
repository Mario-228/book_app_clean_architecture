import 'package:book_app_clean_architecture/core/errors/error.dart';
import 'package:book_app_clean_architecture/core/use_cases/use_case.dart';
import 'package:book_app_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_architecture/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  const FetchFeaturedBooksUseCase({required this.homeRepo});
  final HomeRepo homeRepo;

  @override
  Future<Either<Errors, List<BookEntity>>> call({int param = 0}) async {
    return await homeRepo.fetchFeaturedBooks(pageNumber: param);
  }
}
