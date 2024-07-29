class BookEntity {
  String bookId;
  String? image;
  String title;
  String? author;
  num? rate;
  num? rateCount;
  BookEntity(
      {required this.bookId,
      required this.title,
      required this.author,
      required this.rate,
      required this.rateCount,
      required this.image});
}
