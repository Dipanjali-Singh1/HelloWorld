import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_backend/components/text_widget.dart';
import 'package:flutter_app_backend/models/get_article_info.dart';
import 'package:flutter_app_backend/models/get_news_info.dart';

class NewsDetailPage extends StatefulWidget {
  final NewsInfo newsInfo;

  final int index;
  NewsDetailPage({Key key, this.newsInfo, this.index}) : super(key: key);

  @override
  NewsDetailPageState createState() => NewsDetailPageState();
}

class NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: 30,
              backgroundColor: Color(0xFFffffff),
              elevation: 0.0,
            ),
            body: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 0, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            icon: Icon(Icons.arrow_back_ios,
                                color: Color(0xFF363f93)),
                            onPressed: () => Navigator.pop(context))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Material(
                          elevation: 0.0,
                          child: Container(
                            height: 180,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3))
                                ],
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "http://192.168.46.251/uploads/" +
                                            this.widget.newsInfo.img),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Container(
                          width: screenWidth - 30 - 180 - 20,
                          margin: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              TextWidget(
                                text: this.widget.newsInfo.title,
                                fontSize: 30,
                              ),
                              TextWidget(
                                  text: "Author: admin",
                                  fontSize: 20,
                                  color: Color(0xFF7b8ea3)),
                              Divider(color: Colors.grey),
                              TextWidget(
                                  text: this.widget.newsInfo.title,
                                  fontSize: 16,
                                  color: Color(0xFF7b8ea3)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Divider(color: Color(0xFF7b8ea3)),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      TextWidget(
                        text: "News Details",
                        fontSize: 30,
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 200,
                    child: TextWidget(
                        text: this.widget.newsInfo.article_content,
                        fontSize: 16,
                        color: Colors.grey),
                  ),
                  Divider(color: Color(0xFF7b8ea3)),
                ],
              ),
            )),
      ),
    );
  }
}
