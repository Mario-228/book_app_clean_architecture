import 'package:book_app_clean_architecture/constants.dart';
import 'package:book_app_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImplementation extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    var startIndex = pageNumber * 10;
    var endIndex = (pageNumber + 1) * 10;
    var length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
