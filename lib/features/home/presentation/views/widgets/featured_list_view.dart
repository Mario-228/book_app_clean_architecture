import 'package:book_app_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:book_app_clean_architecture/features/home/presentation/views_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    late final ScrollController scrollController = ScrollController();
    int nextPage = 1;
    bool isLoading = false;
    void scrollListener() async {
      var currentIndex = scrollController.position.pixels;
      var maxLength = scrollController.position.maxScrollExtent;
      if (currentIndex >= 0.7 * maxLength) {
        if (!isLoading) {
          isLoading = true;
          await BlocProvider.of<FeaturedBooksCubit>(context)
              .fetchFeaturedBooks(pageNumber: nextPage++);
          isLoading = false;
        }
      }
    }

    return Builder(builder: (context) {
      scrollController.addListener(scrollListener);

      return SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            itemCount: books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomBookImage(
                  image: books[index].image ?? "",
                ),
              );
            }),
      );
    });
  }
}
