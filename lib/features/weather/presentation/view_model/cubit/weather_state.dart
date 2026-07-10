part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherResponseModel weatherResponseModel;
  WeatherSuccess({required this.weatherResponseModel});
}

final class WeatherError extends WeatherState {
  final String errorMassage;
  WeatherError({required this.errorMassage});
}
