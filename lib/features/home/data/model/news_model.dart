import 'package:news_app_nti/features/home/data/model/articles_model.dart';

class NewsModel {
  String? status;
  int? totalResults;
  List<ArticlesModel>? articles;
  NewsModel({this.status, this.articles, this.totalResults});
  NewsModel.formjson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((e) {
        articles!.add(ArticlesModel.fromjson(e));
      });
    }
  }
}
