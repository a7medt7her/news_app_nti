import 'package:dartz/dartz.dart';
import 'package:news_app_nti/core/helper/dio_helper.dart';
import 'package:news_app_nti/features/home/data/model/news_model.dart';

class NewsRepo {
  static Future<Either<String, NewsModel>> getToHeadLines(
    String q,
    String category,
  ) async {
    try {
      final response = await dio.get(
        'top-headlines',
        queryParameters: {'q': q, 'apiKey': newsApiKey, 'category': category},
      );
      var data = response.data;
      NewsModel newsModel = NewsModel.formjson(data);
      return right(newsModel);
    } catch (e) {
      return left(errorMassage(e));
    }
  }

  static Future<Either<String, NewsModel>> getEverything(
    String q,
    String? sortBy,
  ) async {
    try {
      final response = await dio.get(
        'everything',
        queryParameters: {'q': q, 'apiKey': newsApiKey, 'sortBy': sortBy},
      );
      var data = response.data;
      NewsModel newsModel = NewsModel.formjson(data);
      return right(newsModel);
    } catch (e) {
      return left(errorMassage(e));
    }
  }
}
