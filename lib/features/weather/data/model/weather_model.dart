class WeatherModel {
  int? id;
  String? main;
  String? description;
  String? icon;
  WeatherModel({this.id, this.main, this.description, this.icon});
  WeatherModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}
