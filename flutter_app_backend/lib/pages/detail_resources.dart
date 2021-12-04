import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_backend/components/text_widget.dart';
import 'package:flutter_app_backend/models/get_resources_info.dart';

class DetailResourcesPage extends StatefulWidget {
  final ResourcesInfo resourcesInfo;
  final int index;
  DetailResourcesPage({Key key, this.resourcesInfo, this.index})
      : super(key: key);

  @override
  _DetailResourcesPageState createState() => _DetailResourcesPageState();
}

class _DetailResourcesPageState extends State<DetailResourcesPage> {
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
                    height: 10,
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
                                            this.widget.resourcesInfo.img),
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
                                height: 6,
                              ),
                              TextWidget(
                                text: this.widget.resourcesInfo.title,
                                fontSize: 30,
                              ),
                              TextWidget(
                                  text: "Author: Admin",
                                  fontSize: 20,
                                  color: Color(0xFF7b8ea3)),
                              Divider(color: Colors.grey),
                              TextWidget(
                                  text: this.widget.resourcesInfo.title,
                                  fontSize: 16,
                                  color: Color(0xFF7b8ea3)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(color: Color(0xFF7b8ea3)),
                  SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      TextWidget(
                        text: "Details",
                        fontSize: 30,
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          TextWidget(
                              text: this.widget.resourcesInfo.article_content,
                              fontSize: 16,
                              color: Colors.grey),
                          TextWidget(
                              text: this.widget.resourcesInfo.description,
                              fontSize: 12,
                              color: Colors.grey),
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
