import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_backend/api/my_api.dart';
import 'package:flutter_app_backend/components/app_buttons.dart';
import 'package:flutter_app_backend/components/button_widget.dart';
import 'package:flutter_app_backend/components/text_widget.dart';
import 'package:flutter_app_backend/pages/article_page.dart';
import 'package:flutter_app_backend/pages/news_page.dart';
import 'package:flutter_app_backend/models/get_home_info.dart';
import 'package:flutter_app_backend/pages/detail_book.dart';
import 'package:flutter_app_backend/pages/remedial_page.dart';
import 'package:flutter_app_backend/pages/startingrightdetails.dart';
import 'package:flutter_app_backend/pages/faqdetails.dart';
import 'package:flutter_app_backend/pages/aboutdetails.dart';
import 'package:flutter_app_backend/pages/resources_page.dart';
import 'package:flutter_app_backend/pages/testimonial.dart';
import 'package:flutter_app_backend/pages/survey.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'aboutdetails.dart';
import 'workshop.dart';

class HomesPage extends StatefulWidget {
  const HomesPage({Key key}) : super(key: key);
// final List<HomesPage> allhomes;
  //final int index;
  //  HomesPage({Key key, this.homeinfo, this.index}) : super(key: key);
  @override
  _HomesPageState createState() => _HomesPageState();
}

class _HomesPageState extends State<HomesPage> {
  var homes = <HomeInfo>[];
  var allhomes = <HomeInfo>[];

  @override
  void initState() {
    _getHomes();
    super.initState();
  }

  _getHomes() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString("user");

    await _initData();
  }

  _initData() async {
    await CallApi().getPublicData("allhomes").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        allhomes = list.map((model) => HomeInfo.fromJson(model)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    debugPrint(height.toString());
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("Home"),
              toolbarHeight: 60,
              backgroundColor: Color(0xFF363f93),
              elevation: 0.0,
              leading: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomesPage()));
                },
                child: Icon(
                  Icons.home_filled,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 8.0,
                  ),

                  // padding: const EdgeInsets.only(left: 20),
                  //singlechildscrollview->scroll/refresh one child instead of the entire page
                  Container(
                      padding: EdgeInsets.only(left: 10.0),
                      height: 100,
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 150,
                            child: ButtonWidget(
                              text: 'News',
                              onClicked: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewsPage()),
                              ),
                            ),
                          ),
                          SizedBox(width: 1.0),
                          Container(
                            width: 150,
                            padding: EdgeInsets.only(left: 10.0),
                            child: ButtonWidget(
                              text: 'Remedial',
                              onClicked: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RemedialPage()),
                              ),
                            ),
                          ),
                          SizedBox(width: 1.0),
                          Container(
                            width: 150,
                            padding: EdgeInsets.only(left: 10.0),
                            child: ButtonWidget(
                              text: 'Skills',
                              onClicked: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ArticlePage()),
                              ),
                            ),
                          ),
                          SizedBox(width: 1.0),
                          Container(
                            width: 150,
                            padding: EdgeInsets.only(left: 10.0),
                            child: ButtonWidget(
                              text: 'Testimonial',
                              onClicked: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TestimonialPage()),
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            padding: EdgeInsets.only(left: 10.0),
                            child: ButtonWidget(
                              text: 'About Us',
                              onClicked: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutDetailsPage()),
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            padding: EdgeInsets.only(left: 10.0),
                            child: ButtonWidget(
                              text: 'Workshop',
                              onClicked: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WorkshopPage()),
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            padding: EdgeInsets.only(left: 10.0),
                            child: ButtonWidget(
                              text: 'Resources',
                              onClicked: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResourcesPage()),
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            padding: EdgeInsets.only(left: 10.0),
                            child: ButtonWidget(
                              text: 'Starting Right',
                              onClicked: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        StartingRightDetailsPage()),
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            padding: EdgeInsets.only(left: 10.0),
                            child: ButtonWidget(
                              text: 'FAQ',
                              onClicked: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FAQDetailsPage()),
                              ),
                            ),
                          ),

                           Container(
                            width: 150,
                            padding: EdgeInsets.only(left: 10.0),
                            child: ButtonWidget(
                              text: 'Survey',
                              onClicked: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SurveyPage()),
                              ),
                            ),
                          ),

                          Container(
                            width: 150,
                            padding: EdgeInsets.only(left: 10.0),
                            child: ButtonWidget(
                              text: 'Notification',
                              onClicked: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TestimonialPage()),
                              ),
                            ),
                          ),
                        ],
                      )),

                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                      height: 500,
                      child: PageView.builder(
                          controller: PageController(viewportFraction: 1.0),
                          itemCount: allhomes == null ? 0 : allhomes.length,
                          itemBuilder: (_, i) {
                            return Container(
                              height: 500,
                              width: 300,
                              margin: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Card(
                                    child: TextWidget(
                                      text: allhomes[i].title,
                                      fontSize: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.0,
                                  ),
                                  Card(
                                    child: TextWidget(
                                      text: allhomes[i].description,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.0,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                      height: 300,
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.network(
                                          "http://192.168.46.251/uploads/" +
                                              allhomes[i].img,
                                          fit: BoxFit.contain,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        elevation: 5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })),
                ])),
      ),
    );
  }
}
