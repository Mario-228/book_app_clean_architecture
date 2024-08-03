import 'package:book_app_clean_architecture/features/home/domain/entities/book_entity.dart';

abstract class FeaturedBooksState {
  const FeaturedBooksState();
}

class FeaturedBooksInitialState extends FeaturedBooksState {}

class FeaturedBooksLoadingState extends FeaturedBooksState {}

class FeaturedBooksSuccessState extends FeaturedBooksState {
  final List<BookEntity> books;
  const FeaturedBooksSuccessState({required this.books});
}

class FeaturedBooksFailureState extends FeaturedBooksState {
  final String errorMessage;
  const FeaturedBooksFailureState({required this.errorMessage});
}
