import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final Widget widget;
  const MyInputField(
      {Key key,
       this.title,
       this.hint,
      this.controller,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
             style: TextStyle(color: Color(0xFF9b9b9b))
             ),
          
          Container(
            height: 52,
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(left: 20, right: 20),
            //color: Colors.grey,
            // width: 300,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    //if false means that readonly widget is null hence can type
                    readOnly: widget==null?false:true,

                    autofocus: false,
                    cursorColor: Color(0xFF9b9b9b),
                    controller:controller, 
                    style: TextStyle(color: Color(0xFF000000)),
                    decoration: InputDecoration(
                      hintText:hint,
                      hintStyle: TextStyle( color: Color(0xFF9b9b9b), fontSize: 14, fontWeight: FontWeight.normal),
      
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF9b9b9b),
                          width: 0
                        )
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF9b9b9b),
                          width: 0))
                    ),
                  ),

                ),
                //not passing aything show empty container
                widget==null?Container():Container(child: widget)
              ],
            ),
          ),
        ],
      ),
    );
  }
}


