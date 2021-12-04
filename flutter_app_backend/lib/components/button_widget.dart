import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
    final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
     this.text,
     this.onClicked,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        onPressed: onClicked,
        color: Color(0xFF333d94),
        textColor: Colors.white,
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      );
}