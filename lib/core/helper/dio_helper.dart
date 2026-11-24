import 'package:dio/dio.dart';

// Keys are supplied at build time and are not stored in the repository:
//   flutter run --dart-define-from-file=env.json
const String newsApiKey = String.fromEnvironment('NEWS_API_KEY');
const String weatherApiKey = String.fromEnvironment('WEATHER_API_KEY');

Dio dio = Dio(BaseOptions(baseUrl: 'https://newsapi.org/v2/'));
Dio dioWeather = Dio(
  BaseOptions(baseUrl: 'https://api.openweathermap.org/data/2.5/'),
);
String errorMassage(Object e, [StackTrace? s]) {
  if (e is DioException) {
    String errorMassage = e.response?.data['message'];
    return errorMassage;
  } else {
    print(e);
    print(s);
    return 'something wrong';
  }
}
