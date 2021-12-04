import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_backend/api/my_api.dart';
import 'package:flutter_app_backend/components/text_input.dart';
import 'package:flutter_app_backend/components/text_widget.dart';
import 'package:flutter_app_backend/pages/homes_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestimonialPage extends StatefulWidget {
  const TestimonialPage({Key key}) : super(key: key);

  @override
  _TestimonialPageState createState() => _TestimonialPageState();
}

class _TestimonialPageState extends State<TestimonialPage> {
  TextEditingController feedbackController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _feedback() async {
    var data = {
      'description': feedbackController.text,
    };
    debugPrint(feedbackController.text);

    var res = await CallApi().postTData(data, 'feedback');
    var body = json.decode(res.body);
    if (body['success']) {
      Navigator.push(this.context,
          new MaterialPageRoute(builder: (context) => HomesPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Testimonial"),
        toolbarHeight: 60,
        backgroundColor: Color(0xFF363f93),
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
            //  padding: const EdgeInsets.only(left:30, right:40),
            children: [
              //scrollDirection: Axis.vertical,
              Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                     height: 600,
                      padding: const EdgeInsets.only(left: 30, right: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 8.0),
                          // padding: const EdgeInsets.only(left: 30, right: 40),
                          TextWidget(
                            text: "Enter your feedback",
                            fontSize: 20,
                          ),
                          SizedBox(height: 2.0),
                          TextInput(
                              textString: "Feedback",
                              textController: feedbackController,
                              hint: "feedback"),
                          SizedBox(
                            height: 10.0,
                          ),
                          GestureDetector(
                              onTap: () {
                                _feedback();
                              },
                              child: Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xFF7179ed),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Submit',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 26),
                                      ),
                                    ],
                                  )))
                        ],
                      ),
                    ),
                  ),
                
              ),
            ]),
   
    );
  }
}

class TextInput extends StatelessWidget {
  final String textString;
  TextEditingController textController;
  final String hint;
  bool obscureText;
  TextInput(
      {Key key,
      this.textString,
      this.textController,
      this.hint,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Color(0xFF000000)),
      cursorColor: Color(0xFF9b9b9b),
      controller: textController,
      keyboardType: TextInputType.text,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: this.textString,
        hintStyle: TextStyle(
            color: Color(0xFF9b9b9b),
            fontSize: 20,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
