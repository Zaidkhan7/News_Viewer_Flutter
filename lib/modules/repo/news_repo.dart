import 'package:dio/dio.dart';

class NewsRepo
{
  final URL = "https://raw.githubusercontent.com/Zaidkhan7/test_git/main/db.json";

  NewsRepo._();
  static NewsRepo newsRepo = NewsRepo._();

  static NewsRepo getInstance()
  {
    return newsRepo;
  }

  final client= Dio();

  Future<dynamic> getNews()
  {
    Future<Response> response = client.get(URL);
    print("response");
    print(response);
    return response;
  }
}