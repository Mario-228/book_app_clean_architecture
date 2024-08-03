import 'package:book_app_clean_architecture/features/home/domain/entities/book_entity.dart';

abstract class NewestBooksState {
  const NewestBooksState();
}

class NewestBooksInitialState extends NewestBooksState {}

class NewestBooksLoadingState extends NewestBooksState {}

class NewestBooksFailureState extends NewestBooksState {
  final String message;
  const NewestBooksFailureState({required this.message});
}

class NewestBooksSuccessState extends NewestBooksState {
  final List<BookEntity> books;
  const NewestBooksSuccessState({required this.books});
}
