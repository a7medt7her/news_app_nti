class WindModel {
  double? speed;
  int? deg;
  double? gust;
  WindModel({this.speed, this.deg, this.gust});
  WindModel.fromjson(Map<String, dynamic> json) {
    speed = (json['speed'] as num?)?.toDouble();
    deg = (json['deg'] as num?)?.toInt();
    gust = (json['gust'] as num?)?.toDouble();
  }
}
