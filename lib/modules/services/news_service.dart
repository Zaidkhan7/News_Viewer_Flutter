import 'dart:convert';

//import 'package:madproject/modules/models/order.dart';
import 'package:news_viewer/modules/models/NewsModel.dart';

class NewsService{

  List<NewsModel>convertNews(dynamic NewsData)
  {
    late List<NewsModel> news = [];
    String str  = NewsData.data.toString();
    //print(str);
    Map temp = jsonDecode(str);
   //print(temp);
       List<dynamic> list = temp["data"];
       print(list);
    news = list.map((onenews) => NewsModel.FromJSON(onenews)).toList();
    

    return news;  

  }
  
}