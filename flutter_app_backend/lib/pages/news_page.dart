import 'dart:convert';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_backend/api/my_api.dart';
import 'package:flutter_app_backend/components/text_widget.dart';
import 'package:flutter_app_backend/models/get_article_info.dart';
import 'package:flutter_app_backend/models/get_news_info.dart';
import 'package:flutter_app_backend/pages/homes_page.dart';
import 'package:flutter_app_backend/pages/news_detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'detail_book.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({ Key key }) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}
class _NewsPageState extends State<NewsPage> {
  var news = <NewsInfo>[];
  var allnews = <NewsInfo>[];
  var weeklynews = <NewsInfo>[];
  var announcements = <NewsInfo>[];
  
@override
  void initState() {
    _getNews();
    super.initState();
  }

  _getNews() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString("user");
    await _initData();
  }

  _initData() async {
    await CallApi().getPublicData("allnews").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        allnews = list.map((model) => NewsInfo.fromJson(model)).toList();
      });
    });
    await CallApi().getPublicData("weeklynews").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        weeklynews = list.map((model) => NewsInfo.fromJson(model)).toList();
      });
    });
     await CallApi().getPublicData("announcements").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        announcements = list.map((model) => NewsInfo.fromJson(model)).toList();
      });
    });
  }


  
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    debugPrint(height.toString());
     return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("News"),
        toolbarHeight: 60,
        backgroundColor:  Color(0xFF363f93),
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomesPage()));
          },
          child: Icon(
            Icons.home_filled,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
        
          SizedBox(height: height * 0.01),        
          Container(
            padding: const EdgeInsets.only(left: 20, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "Recent News",
                  fontSize: 20,
                ),
                Expanded(child: Container()),
                Row(
                  children: [
                    TextWidget(
                        text: "view all",
                        fontSize: 16,
                        color: Color(0xFF363f93)),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios,
                          color: Color(0xFF363f93)),
                      onPressed: () {},
                    )
                  ],
                ),
              ],
            ),
          ),
          //SizedBox(height: height * 0.01),
          Container(
              height: height * 0.2,
              child: PageView.builder(
                  controller: PageController(viewportFraction: .9),
                  itemCount: allnews == null ? 0 : allnews.length,
                  itemBuilder: (_, i) {
                    return GestureDetector(
                        onTap: () {
                          debugPrint(i.toString());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsDetailPage(
                                      newsInfo: allnews[i], index: i)));
                        },
                        child: allnews.length == 0
                            ? CircularProgressIndicator()
                            : Stack(
                                children: [
                                  Positioned(
                                    //draws the entire white card for recommend
                                    top: 5,
                                    child: new Material(
                                      elevation: 0.0,
                                      child: new Container(
                                        height: 120.0,
                                        width: width * 0.86,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          boxShadow: [
                                            new BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                offset: new Offset(-10.0, 0.0),
                                                blurRadius: 20.0,
                                                spreadRadius: 4.0)
                                          ]
                                        )
                                        //child:content
                                      ),
                                    ),
                                  ),
                                  // Positioned(
                                  //   //draws image on top of the card(recommend)
                                  //   top: 0,
                                  //   left: 10,
                                  //   child: Card(
                                  //     //img card
                                  //     elevation: 10.0,
                                  //     shadowColor: Colors.grey.withOpacity(0.5),
                                  //     shape: RoundedRectangleBorder(
                                  //         borderRadius:
                                  //             BorderRadius.circular(15.0)),
                                  //     child: Container(
                                  //       height: 200,
                                  //       width: 150,
                                  //       decoration: BoxDecoration(
                                  //           //the little shadow around the image
                                  //           borderRadius:
                                  //               BorderRadius.circular(10.0),
                                  //           image: DecorationImage(
                                  //             fit: BoxFit.fill,
                                  //             image: NetworkImage(
                                  //                 "http://192.168.56.1/uploads/" +
                                  //                     articles[i].img),
                                  //           )),
                                  //     ),
                                  //   ),
                                  // ),
                                  Positioned(
                                    //showing text beside the image [author, title,description]
                                    top: 25,
                                    left: width * 0.2,
                                    child: Container(
                                      height: 200,
                                      width: 150,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text: allnews[i].title,
                                            fontSize: 20,
                                          ),
                                          TextWidget(
                                            color: Colors.grey,
                                            text: allnews[i].author == null
                                                ? "admin"
                                                : allnews[i].author,
                                            fontSize: 16,
                                          ),
                                          Divider(color: Colors.black),
                                          TextWidget(
                                            color: Colors.grey,
                                            text: allnews[i].description,
                                            fontSize: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ));
                  })),
         Container(
            padding: const EdgeInsets.only(left: 20, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "Weekly News",
                  fontSize: 20,
                ),
                Row(
                  children: [
                    TextWidget(
                        text: "view all",
                        fontSize: 16,
                        color: Color(0xFF363f93)),
                    IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF363f93),
                          size: 16,
                        ),
                        onPressed: () {})
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              //singlechildscrollview->scroll/refresh one child instead of the entire page
              child: Container(
                  height: height * 0.3,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: weeklynews == null ? 0 : weeklynews.length,
                      itemBuilder: (_, i) {
                        //debugPrint(allarticles[i].img.toString());
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewsDetailPage(
                                          newsInfo: weeklynews[i], index: i)));
                            },
                            child: weeklynews.length == 0
                                ? CircularProgressIndicator()
                                : Container(
                                    height: height * 0.3,
                                    width: 150,
                                    margin: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Card(
                                          semanticContainer: true,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Image.network(
                                            "http://192.168.46.251/uploads/" +
                                                weeklynews[i].img,
                                            fit: BoxFit.contain,
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          elevation: 5,
                                        ),
                                        TextWidget(
                                          text: weeklynews[i].title,
                                          fontSize: 20,
                                        ),
                                        TextWidget(
                                            text: weeklynews[i].author == null
                                                ? "Author:admin"
                                                : "Author: " +
                                                    weeklynews[i].author,
                                            fontSize: 16,
                                            color: Color(0xFFa9b3bd))
                                      ],
                                    ),
                                  ));
                      })),
            ),
          ),
         // SizedBox(height: height*0.02,),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "Announcements",
                  fontSize: 20,
                ),
                Row(
                  children: [
                    TextWidget(
                        text: "view all",
                        fontSize: 16,
                        color: Color(0xFF363f93)),
                    IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF363f93),
                          size: 16,
                        ),
                        onPressed: () {})
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              //singlechildscrollview->scroll/refresh one child instead of the entire page
              child: Container(
                  height: height * 0.2,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: announcements == null ? 0 : announcements.length,
                      itemBuilder: (_, i) {
                        //debugPrint(allarticles[i].img.toString());
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewsDetailPage(
                                          newsInfo: announcements[i], index: i)));
                            },
                            child: announcements.length == 0
                                ? CircularProgressIndicator()
                                : Container(
                                    height: height * 0.6,
                                    width: 60,
                                    margin: const EdgeInsets.only(left: 20, right: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Card(
                                          semanticContainer: true,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Image.network(
                                            "http://192.168.46.251/uploads/" +
                                                announcements[i].img,
                                            fit: BoxFit.contain,
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          elevation: 5,
                                        ),
                                        TextWidget(
                                          text: announcements[i].title,
                                          fontSize: 20,
                                        ),
                                        TextWidget(
                                            text: announcements[i].author == null
                                                ? "Author:admin"
                                                : "Author: " +
                                                    announcements[i].author,
                                            fontSize: 16,
                                            color: Color(0xFFa9b3bd))
                                      ],
                                    ),
                                  ));
                      })),
            ),
          )
        ],
      ),
    );
  }
}