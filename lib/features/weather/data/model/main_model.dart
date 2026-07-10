class MainModel {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;
  MainModel({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.grndLevel,
    this.humidity,
    this.seaLevel,
  });
  MainModel.fromjson(Map<String, dynamic> json) {
    temp = (json['temp'] as num?)?.toDouble();
    feelsLike = (json['feels_like'] as num?)?.toDouble();

    tempMin = (json['temp_min'] as num?)?.toDouble();

    tempMax = (json['temp_max'] as num?)?.toDouble();
    pressure = (json['pressure'] as num?)?.toInt();
    humidity = (json['humidity'] as num?)?.toInt();
    seaLevel = (json['sea_level'] as num?)?.toInt();
    grndLevel = (json['grnd_level'] as num?)?.toInt();
  }
}
