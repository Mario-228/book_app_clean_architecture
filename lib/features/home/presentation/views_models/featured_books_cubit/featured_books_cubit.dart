import 'package:book_app_clean_architecture/features/home/presentation/views_models/featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit() : super(FeaturedBooksInitialState());

  static FeaturedBooksCubit get(context) => BlocProvider.of(context);
}
