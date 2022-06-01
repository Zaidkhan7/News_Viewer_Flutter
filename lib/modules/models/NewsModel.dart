class NewsModel{

  late String title;
  late String summary;
  late String published;
  NewsModel({required this.title,required this.summary,required this.published});  

  NewsModel.FromJSON(Map<String, dynamic> data) {
    
    published = data["published"];
    summary = data["summary"];
    title = data["title"];
   
  }


}