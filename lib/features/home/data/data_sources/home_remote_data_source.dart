import 'package:book_app_clean_architecture/constants.dart';
import 'package:book_app_clean_architecture/core/utils/api_service.dart';
import 'package:book_app_clean_architecture/core/utils/functions/save_books.dart';
import 'package:book_app_clean_architecture/features/home/data/models/book_model/book_model.dart';
import 'package:book_app_clean_architecture/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImplementation(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data =
        await apiService.get("volumes?q=programming&Filtering=free-ebooks");

    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService
        .get("volumes?q=programming&Filtering=free-ebooks&Sorting=newest");

    List<BookEntity> books = getBooksList(data);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}
