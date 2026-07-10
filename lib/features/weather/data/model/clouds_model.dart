class CloudsModel {
  int? all;
  CloudsModel({this.all});
  CloudsModel.formjson(Map<String, dynamic> json) {
    all = (json['all'] as num?)?.toInt();
  }
}
