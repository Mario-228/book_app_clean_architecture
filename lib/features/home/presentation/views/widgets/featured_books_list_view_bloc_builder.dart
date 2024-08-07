import 'package:book_app_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_architecture/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:book_app_clean_architecture/features/home/presentation/views_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app_clean_architecture/features/home/presentation/views_models/featured_books_cubit/featured_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<BookEntity> books = [];
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
        listener: (context, state) {
      if (state is FeaturedBooksSuccessState) {
        books.addAll(state.books);
      }
    }, builder: (context, state) {
      if (state is FeaturedBooksSuccessState ||
          state is FeaturedBooksPaginationLoadingState ||
          state is FeaturedBooksPaginationFailureState) {
        return FeaturedBooksListView(
          books: books,
        );
      } else if (state is FeaturedBooksFailureState) {
        return Center(
          child: Text(state.errorMessage),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
