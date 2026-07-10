import 'package:news_app_nti/features/weather/data/model/clouds_model.dart';
import 'package:news_app_nti/features/weather/data/model/coord_model.dart';
import 'package:news_app_nti/features/weather/data/model/main_model.dart';
import 'package:news_app_nti/features/weather/data/model/sys_model.dart';
import 'package:news_app_nti/features/weather/data/model/weather_model.dart';
import 'package:news_app_nti/features/weather/data/model/wind_model.dart';

class WeatherResponseModel {
  CoordModel? coord;
  List<WeatherModel>? weather;
  String? base;
  MainModel? main;
  int? visibility;
  WindModel? wind;
  CloudsModel? clouds;
  int? dt;
  SysModel? sys;
  int? timeZone;
  int? id;
  String? name;
  int? cod;
  WeatherResponseModel({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.name,
    this.id,
    this.sys,
    this.cod,
    this.dt,
    this.timeZone,
  });
  WeatherResponseModel.fromjson(Map<String, dynamic> json) {
    if (json['coord'] != null) {
      coord = CoordModel.formjson(json['coord']);
    }
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((e) {
        weather!.add(WeatherModel.fromjson(e));
      });
    }
    base = json['base'];
    if (json['main'] != null) {
      main = MainModel.fromjson(json['main']);
    }
    visibility = json['visibility'];
    if (json['wind'] != null) {
      wind = WindModel.fromjson(json['wind']);
    }
    if (json['clouds'] != null) {
      clouds = CloudsModel.formjson(json['clouds']);
    }
    dt = json['dt'];
    if (json['sys'] != null) {
      sys = SysModel.fromjson(json['sys']);
    }
    timeZone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }
}
