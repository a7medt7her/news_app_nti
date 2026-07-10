import 'package:dartz/dartz.dart';
import 'package:news_app_nti/core/helper/dio_helper.dart';
import 'package:news_app_nti/features/weather/data/model/weather_response_model.dart';

class WeatherRepo {
  static Future<Either<String, WeatherResponseModel>> weatherResponse(
    double lat,
    double lon,
  ) async {
    try {
      final response = await dioWeather.get(
        'weather',
        queryParameters: {'lat': lat, 'lon': lon, 'appid': weatherApiKey},
      );
      var data = response.data as Map<String, dynamic>;
      WeatherResponseModel weatherResponseModel = WeatherResponseModel.fromjson(
        data,
      );
      return right(weatherResponseModel);
    } catch (e, s) {
      return left(errorMassage(e, s));
    }
  }
}
