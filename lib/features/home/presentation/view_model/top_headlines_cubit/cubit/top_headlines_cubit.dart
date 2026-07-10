import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_nti/features/home/data/model/news_model.dart';
import 'package:news_app_nti/features/home/data/repo/news_repo.dart';

part 'top_headlines_state.dart';

class TopHeadlinesCubit extends Cubit<TopHeadlinesState> {
  TopHeadlinesCubit() : super(TopHeadlinesInitial());
  static TopHeadlinesCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  Future topHeadlines(String q, String category) async {
    emit(TopHeadlinesLoading());
    final data = await NewsRepo.getToHeadLines(q, category);
    data.fold(
      (l) {
        emit(TopHeadlinesError(errorMassage: l));
      },
      (r) {
        emit(TopHeadlinesSuccess(topHeadlines: r));
      },
    );
  }

  void educator(int index) {
    index = currentIndex;
    emit(TopHeadlinesCurrentIndex(newCurrentIndex: currentIndex));
  }
}
