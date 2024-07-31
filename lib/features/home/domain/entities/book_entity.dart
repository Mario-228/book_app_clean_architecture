import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? author;
  @HiveField(4)
  final num? rate;
  @HiveField(5)
  final num? rateCount;
  BookEntity(
      {required this.bookId,
      required this.title,
      required this.author,
      required this.rate,
      required this.rateCount,
      required this.image});
}
