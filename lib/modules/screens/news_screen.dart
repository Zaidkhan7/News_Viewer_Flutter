import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_viewer/modules/models/NewsModel.dart';
import 'package:news_viewer/modules/repo/news_repo.dart';
import 'package:news_viewer/modules/services/news_service.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  NewsRepo newsrepo = NewsRepo.getInstance();


  @override
  Widget build(BuildContext context) {
    return Scaffold( 
    
    body: SafeArea(
      child: FutureBuilder(
        future: newsrepo.getNews(),
        builder: (context, snapshot) {
    
        if(snapshot.connectionState==ConnectionState.waiting)
        {
          return const Center(child: CircularProgressIndicator(),);
        }
    
        else if(snapshot.hasError)
        {
          return Text("An Error Occured");
        }
        else
        {
          List<NewsModel> list = NewsService().convertNews(snapshot.data);
    
          return Expanded(child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context,index){
              return ListTile(
                  //leading: IconButton(icon: Icon(Icons.heart_broken),onPressed:(){} ,),
                 // title: Text("${list[index].title}", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  
              );
            }
            ));
        }
    
    
      },
      ),
    ),
    );
    
  }
}