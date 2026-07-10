import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_nti/features/weather/data/model/weather_response_model.dart';
import 'package:news_app_nti/features/weather/data/repo/weather_repo.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  Future getWeather(double lat, double lon) async {
    emit(WeatherLoading());
    final data = await WeatherRepo.weatherResponse(lat, lon);
    data.fold(
      (l) {
        emit(WeatherError(errorMassage: l));
      },
      (r) {
        emit(WeatherSuccess(weatherResponseModel: r));
      },
    );
  }
}
