import 'package:dio/dio.dart';

String newsApiKey = '836086f05b344448a16dd41ee51c6320';
String weatherApiKey = '39ef56aa87e0f9d833e66cd9111de959';
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
