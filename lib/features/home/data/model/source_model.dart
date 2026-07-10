class SourceModel {
  String? id;
  String? name;
  SourceModel({this.id, this.name});
  SourceModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
