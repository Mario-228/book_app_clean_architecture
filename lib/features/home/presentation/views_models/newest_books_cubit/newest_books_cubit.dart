import 'package:book_app_clean_architecture/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:book_app_clean_architecture/features/home/presentation/views_models/newest_books_cubit/newest_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase)
      : super(NewestBooksInitialState());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  static NewestBooksCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoadingState());
    var result = await fetchNewestBooksUseCase.call();
    result.fold((error) {
      emit(NewestBooksFailureState(message: error.errorMessage));
    }, (value) {
      emit(NewestBooksSuccessState(books: value));
    });
  }
}
