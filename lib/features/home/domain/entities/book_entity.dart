class BookEntity {
  String title;
  String author;
  String image;
  num price;
  num rate;
  num rateCount;
  BookEntity(
      {required this.title,
      required this.author,
      required this.price,
      required this.rate,
      required this.rateCount,
      required this.image});
}
