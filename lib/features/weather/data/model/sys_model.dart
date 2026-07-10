class SysModel {
  String? country;
  int? sunrise;
  int? sunset;
  SysModel({this.country, this.sunrise, this.sunset});
  SysModel.fromjson(Map<String, dynamic> json) {
    country = json['country'];
    sunrise = (json['sunrise'] as num?)?.toInt();
    sunset = (json['sunset'] as num?)?.toInt();
  }
}
