part of 'top_headlines_cubit.dart';

@immutable
sealed class TopHeadlinesState {}

final class TopHeadlinesInitial extends TopHeadlinesState {}

final class TopHeadlinesLoading extends TopHeadlinesState {}

final class TopHeadlinesSuccess extends TopHeadlinesState {
  final NewsModel topHeadlines;
  TopHeadlinesSuccess({required this.topHeadlines});
}

final class TopHeadlinesError extends TopHeadlinesState {
  final String errorMassage;
  TopHeadlinesError({required this.errorMassage});
}

final class TopHeadlinesCurrentIndex extends TopHeadlinesState {
  final int newCurrentIndex;
  TopHeadlinesCurrentIndex({required this.newCurrentIndex});
}
