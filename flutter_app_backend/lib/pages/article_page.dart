import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_backend/api/my_api.dart';
import 'package:flutter_app_backend/components/text_widget.dart';
import 'package:flutter_app_backend/models/get_remedial_info.dart';
import 'package:flutter_app_backend/pages/detail_remedial.dart';
import 'package:flutter_app_backend/pages/homes_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'skilldetails.dart';
class ArticlePage extends StatefulWidget {
  const ArticlePage({Key key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  var remedial = <RemedialInfo>[];
  var allremedial = <RemedialInfo>[];
  var reading = <RemedialInfo>[];
  var writing = <RemedialInfo>[];
  var workskills = <RemedialInfo>[];
  var referencing = <RemedialInfo>[];
  var numeracy = <RemedialInfo>[];

  @override
  void initState() {
    _getRemedial();
    super.initState();
  }

  _getRemedial() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString("user");
    await _initData();
  }

  _initData() async {
    await CallApi().getPublicData("reading").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        reading = list.map((model) => RemedialInfo.fromJson(model)).toList();
      });
    });
    await CallApi().getPublicData("writing").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        writing = list.map((model) => RemedialInfo.fromJson(model)).toList();
      });
    });
    await CallApi().getPublicData("workskills").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        workskills = list.map((model) => RemedialInfo.fromJson(model)).toList();
      });
    });
    await CallApi().getPublicData("referencing").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        referencing = list.map((model) => RemedialInfo.fromJson(model)).toList();
      });
    });
    await CallApi().getPublicData("numeracy").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        numeracy = list.map((model) => RemedialInfo.fromJson(model)).toList();
      });
    });
    await CallApi().getPublicData("allremedials").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        allremedial =
            list.map((model) => RemedialInfo.fromJson(model)).toList();
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
        title: Text("Skills"),
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
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Numeracy",
                          fontSize: 30,
                        ),
                       
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                      height: height * 0.4,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              numeracy == null ? 0 : numeracy.length,
                          itemBuilder: (_, i) {
                            //debugPrint(allarticles[i].img.toString());
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SkillsdetailPage(
                                              remedialInfo: numeracy[i],
                                              index: i)));
                                },
                                child: numeracy.length == 0
                                    ? CircularProgressIndicator()
                                    : Container(
                                        height: height * 0.4,
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
                                                    numeracy[i].img,
                                                fit: BoxFit.contain,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              elevation: 5,
                                            ),
                                            TextWidget(
                                              text: numeracy[i].title,
                                              fontSize: 20,
                                            ),
                                             TextWidget(
                                              text: numeracy[i].description,
                                              fontSize: 20,
                                            ),
                                          ],
                                        ),
                                      ));
                          })),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Reading",
                          fontSize: 30,
                        ),
                        Expanded(child: Container()),
                        
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                      height: height * 0.4,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              reading == null ? 0 : reading.length,
                          itemBuilder: (_, i) {
                            //debugPrint(allarticles[i].img.toString());
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SkillsdetailPage(
                                              remedialInfo: reading[i],
                                              index: i)));
                                },
                                child: reading.length == 0
                                    ? CircularProgressIndicator()
                                    : Container(
                                        height: height * 0.4,
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
                                                    reading[i].img,
                                                fit: BoxFit.contain,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              elevation: 5,
                                            ),
                                            TextWidget(
                                              text: reading[i].title,
                                              fontSize: 20,
                                            ),
                                             TextWidget(
                                              text: numeracy[i].description,
                                              fontSize: 20,
                                            ),
                                          ],
                                        ),
                                      ));
                          })),
                  SizedBox(height: height * 0.01),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Writing",
                          fontSize: 30,
                        ),
                        
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                      height: height * 0.4,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              writing == null ? 0 : writing.length,
                          itemBuilder: (_, i) {
                            //debugPrint(allarticles[i].img.toString());
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SkillsdetailPage(
                                              remedialInfo: writing[i],
                                              index: i)));
                                },
                                child: writing.length == 0
                                    ? CircularProgressIndicator()
                                    : Container(
                                        height: height * 0.4,
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
                                                    writing[i].img,
                                                fit: BoxFit.contain,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              elevation: 5,
                                            ),
                                            TextWidget(
                                              text: writing[i].title,
                                              fontSize: 20,
                                            ),
                                            TextWidget(
                                              text: numeracy[i].description,
                                              fontSize: 20,
                                            ),
                                          ],
                                        ),
                                      ));
                          })),
                  SizedBox(height: height * 0.01),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Work Ready Skills",
                          fontSize: 30,
                        ),
                        
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                      height: height * 0.4,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              workskills == null ? 0 : workskills.length,
                          itemBuilder: (_, i) {
                            //debugPrint(allarticles[i].img.toString());
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SkillsdetailPage(
                                              remedialInfo: workskills[i],
                                              index: i)));
                                },
                                child: workskills.length == 0
                                    ? CircularProgressIndicator()
                                    : Container(
                                        height: height * 0.4,
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
                                                    workskills[i].img,
                                                fit: BoxFit.contain,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              elevation: 5,
                                            ),
                                            TextWidget(
                                              text: workskills[i].title,
                                              fontSize: 20,
                                            ),
                                             TextWidget(
                                              text: numeracy[i].description,
                                              fontSize: 20,
                                            ),
                                          ],
                                        ),
                                      ));
                          })),
                  SizedBox(height: height * 0.01),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Referencing",
                          fontSize: 30,
                        ),
                        
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                      height: height * 0.4,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              referencing == null ? 0 : referencing.length,
                          itemBuilder: (_, i) {
                            //debugPrint(allarticles[i].img.toString());
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SkillsdetailPage(
                                              remedialInfo: referencing[i],
                                              index: i)));
                                },
                                child: referencing.length == 0
                                    ? CircularProgressIndicator()
                                    : Container(
                                        height: height * 0.4,
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
                                                    referencing[i].img,
                                                fit: BoxFit.contain,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              elevation: 5,
                                            ),
                                            TextWidget(
                                              text: referencing[i].title,
                                              fontSize: 20,
                                            ),
                                             TextWidget(
                                              text: numeracy[i].description,
                                              fontSize: 20,
                                            ),
                                          ],
                                        ),
                                      ));
                          })),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
