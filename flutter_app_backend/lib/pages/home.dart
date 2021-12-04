import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_backend/models/get_quiz.dart';
import 'resultpage.dart';
import 'quizpage.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_backend/components/text_widget.dart';
import 'package:flutter_app_backend/models/get_article_info.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_backend/api/my_api.dart';
import 'package:flutter_app_backend/components/text_widget.dart';
import 'package:flutter_app_backend/models/get_article_info.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_backend/api/my_api.dart';
import 'package:flutter_app_backend/components/text_widget.dart';
import 'package:flutter_app_backend/models/get_article_info.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_backend/models/get_remedial_info.dart';
import 'package:flutter_app_backend/pages/detail_remedial.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_backend/models/get_quiz.dart';
class homepage extends StatefulWidget {
  const homepage({ Key key }) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var allquiz = <QuizInfo>[];
  var remedial = <RemedialInfo>[];
  var allremedial = <RemedialInfo>[];
  var reading = <RemedialInfo>[];
  var writing = <RemedialInfo>[];
  var workskills = <RemedialInfo>[];
  var referencing = <RemedialInfo>[];
  var numeracy = <RemedialInfo>[];
  @override
  void initState() {
    _getArticles();
    super.initState();
  }

 _getArticles() async {
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
     await CallApi().getPublicData("allquiz").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        allquiz =
            list.map((model) => QuizInfo.fromJson(model)).toList();
      });
    });
   
  }




  List<String> img = [
    "img/quiz.png",
  ];

  List<String> des = [
    "Lets Get Quizzing!!",
  ];
  

  Widget customcard(String langname, String image, String des){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            // in changelog 1 we will pass the langname name to ther other widget class
            // this name will be used to open a particular JSON file 
            // for a particular language
            builder: (context) => getjson(langname),
          ));
        },
        child: Material(
          color: Colors.indigoAccent,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      // changing from 200 to 150 as to look better
                      height: 150.0,
                      width: 150.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    des,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: "Alike"
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose Your Quiz!!",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[

    //      customcard(, img[0], des[0]),
          customcard(reading[0].title, img[0], des[0]),
          customcard(writing[0].title, img[0], des[0]),
          customcard(workskills[0].title, img[0], des[0]),
          customcard(referencing[0].title, img[0], des[0]),
          customcard(numeracy[0].title, img[0], des[0]),
      //    customcard(allarticles[2].title, img[0], allarticles[2].description),
      //    customcard(allarticles[3].title, img[0],allarticles[3].description),
      //    customcard(allarticles[4].title, img[0], allarticles[4].description),
        ],
      ),
    );
  }
}