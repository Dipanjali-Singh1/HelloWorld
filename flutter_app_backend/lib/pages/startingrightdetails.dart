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
import 'package:flutter_app_backend/models/get_startingright_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'skilldetails.dart';
import 'home.dart';
class StartingRightDetailsPage extends StatefulWidget {
  //  final AboutInfo aboutInfo;

  const StartingRightDetailsPage({Key key}) : super(key: key);

  @override
  _StartingRightDetailsPageState createState() => _StartingRightDetailsPageState();
}


class _StartingRightDetailsPageState extends State<StartingRightDetailsPage> {
   var startingrightInfo = <StartingRightInfo>[];

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
    await CallApi().getPublicData("allstartingright").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        startingrightInfo = list.map((model) => StartingRightInfo.fromJson(model)).toList();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: 20,
              title: Text(startingrightInfo[0].title),
              backgroundColor: Color(0xFFffffff),
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              //   color: Colors.white,
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 0, right: 20),
                     decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            icon: Icon(Icons.arrow_back_ios,
                                color: Color(0xFF363f93)),
                            onPressed: () => Navigator.pop(context)),
                        TextWidget(
                          text: this.startingrightInfo[0].title,
                          fontSize: 20,
                          color: Colors.blueAccent,
                          
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(color: Color(0xFF7b8ea3)),
                  Container(
                    width: 800,
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        ),
               //     padding: const EdgeInsets.only(),
                 //   padding: const EdgeInsets.only(right: 20, left:20),
                    child: SingleChildScrollView(
                      //height: 450,
                      
                      child: Column(
                        children: [
                          TextWidget(
                            text: this.startingrightInfo[0].about_content,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          //reading image from laravel
                          Image.network(
                            "http://192.168.46.251/uploads/" +
                                this.startingrightInfo[0].img.toString(),
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  Divider(color: Color(0xFF7b8ea3)), 
                ],
              ),
            )),
      ),
    );
  }
}
