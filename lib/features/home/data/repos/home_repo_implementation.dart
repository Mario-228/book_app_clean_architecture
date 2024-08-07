import 'package:book_app_clean_architecture/core/errors/error.dart';
import 'package:book_app_clean_architecture/features/home/data/data_sources/home_local_data_source.dart';
import 'package:book_app_clean_architecture/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:book_app_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_architecture/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImplementation(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Errors, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    try {
      var booksList =
          homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      var data = await homeRemoteDataSource.fetchFeaturedBooks(
        pageNumber: pageNumber,
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      } else {
        return left(ServerError(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Errors, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var booksList = homeLocalDataSource.fetchNewestBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      var data = await homeRemoteDataSource.fetchNewestBooks();
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      } else {
        return left(ServerError(errorMessage: e.toString()));
      }
    }
  }
}
