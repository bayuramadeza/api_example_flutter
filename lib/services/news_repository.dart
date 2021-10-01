import 'package:api_example/helpers/constanta.dart';
import 'package:dio/dio.dart';

abstract class NewsRepository{
  Future<dynamic> getNews(String countryId);
}

class NewsRepositoryImpl implements NewsRepository{
  @override
  Future getNews(String countryId) async{
    var params = {
      "country" : countryId,
      "apiKey" : API_KEY
    };
    try {
      var response = await Dio().get('https://newsapi.org/v2/top-headlines', queryParameters: params);
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }
}