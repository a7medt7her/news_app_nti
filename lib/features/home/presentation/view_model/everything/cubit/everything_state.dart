part of 'everything_cubit.dart';

@immutable
sealed class EverythingState {}

final class EverythingInitial extends EverythingState {}

final class EverythingLoading extends EverythingState {}

final class EverythingSuccess extends EverythingState {
  final NewsModel everything;
  EverythingSuccess({required this.everything});
}

final class EverythingError extends EverythingState {
  final String errorMassage;
  EverythingError({required this.errorMassage});
}
