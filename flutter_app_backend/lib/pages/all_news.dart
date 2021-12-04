import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_backend/api/my_api.dart';
import 'package:flutter_app_backend/components/text_widget.dart';
import 'package:flutter_app_backend/models/get_news_info.dart';
import 'package:flutter_app_backend/pages/news_detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'news_page.dart';

class AllNews extends StatefulWidget {
  const AllNews({Key key}) : super(key: key);

  @override
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  var news = <NewsInfo>[];
  var allnews = <NewsInfo>[];

  @override
  void initState() {
    _getNews();
    super.initState();
  }

  _getNews() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString("user");

/*
    if(user!=null){
    var userInfo=jsonDecode(user);
      debugPrint(userInfo);
    }else{
      debugPrint("no info");
    }*/
    await _initData();
  }
  _initData() async {
    await CallApi().getPublicData("allnews").then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        news= list.map((model)=>NewsInfo.fromJson(model)).toList();
      });
    });
    await CallApi().getPublicData("allarticlestypes").then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        news= list.map((model)=>NewsInfo.fromJson(model)).toList();
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(

      body: Container(
        color:Colors.white,
        child: SafeArea(
          child:

      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height*0.0,),
          Container(
            padding: const EdgeInsets.only(left:20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon:

                Icon(Icons.arrow_back_ios, color:Color(0xFF363f93)),
                    onPressed:()=> Navigator.pop(context)),
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon:

                Icon(Icons.home_outlined, color:Color(0xFF363f93)),
                    onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsPage()))),
              ],
            ),
          ),
      SizedBox(height: 10,),
      Expanded(
        child: SingleChildScrollView(
          child:allnews.length==0?CircularProgressIndicator(): Column(
              children: allnews.map((allnews){
                debugPrint(allnews.img.toString());
                    return GestureDetector(
                        onTap:(){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>NewsDetailPage(newsInfo:allnews, index:0))
                          );
                        },
                        child:Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            height: 250,

                        child: Stack(
                          children: [
                            Positioned(
                                top:35,
                                child: new Material (
                                    elevation: 0.0,
                                    child: new Container(
                                      height: 180.0,
                                      width: width*0.9,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(0.0),
                                        boxShadow: [
                                          new BoxShadow(
                                              color: Colors.grey.withOpacity(0.3),
                                              offset: new Offset(0.0, 0.0),
                                              blurRadius: 20.0,
                                              spreadRadius: 4.0)],
                                      ),
                                      // child: Text("This is where your content goes")
                                    )
                                )
                            ),
                            Positioned(
                                top:0,
                                left: 10,
                                child: Card(
                                    elevation: 10.0,
                                    shadowColor: Colors.grey.withOpacity(0.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child:Container(
                                        height: 200,
                                        width: 150,
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10.0),
                                          image:  DecorationImage(
                                            fit:BoxFit.fill,
                                            image:NetworkImage("http://192.168.46.251/uploads/"+allnews.img),
                                          ),
                                        )

                                    )
                                )
                            ),
                            Positioned(
                                top:45,
                                left: width*0.4,
                                child: Container(
                                    height: 200,
                                    width: 150,
                                    child:Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                            text:allnews.title,
                                            fontSize: 20,
                                            color:Colors.grey
                                        ),
                                        
                                        Divider(
                                            color:Colors.black
                                        ),
                                        TextWidget(
                                            text:allnews.description,
                                            fontSize: 16,
                                            color:Colors.grey
                                        ),
                                      ],
                                    )
                                )
                            ),
                          ],
                        )
                        )
                    );
    }).toList(),
          ),

        ),
      ),
        ],
      )
        ),
      )
    );
  }
}
