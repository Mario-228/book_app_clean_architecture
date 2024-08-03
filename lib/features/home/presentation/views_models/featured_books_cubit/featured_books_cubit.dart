import 'package:book_app_clean_architecture/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:book_app_clean_architecture/features/home/presentation/views_models/featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FeaturedBooksInitialState());

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  static FeaturedBooksCubit get(context) => BlocProvider.of(context);

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoadingState());

    var result = await fetchFeaturedBooksUseCase.call();
    result.fold(
      (error) =>
          emit(FeaturedBooksFailureState(errorMessage: error.errorMessage)),
      (value) => emit(FeaturedBooksSuccessState(books: value)),
    );
  }
}
