import 'package:book_app_clean_architecture/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImplementation extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    throw UnimplementedError();
  }
}
