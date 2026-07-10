class CoordModel {
  double? lon;
  double? lat;
  CoordModel({this.lat, this.lon});
  CoordModel.formjson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }
}
