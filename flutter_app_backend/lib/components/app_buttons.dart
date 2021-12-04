import 'package:flutter/cupertino.dart';

class AppButtons extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  IconData icon;
  double size;
  AppButtons(
      {Key key,
      this.textColor,
      this.backgroundColor,
      this.borderColor,
      this.text,
      this.size,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Center(
        child: Text(
          text,
          style:TextStyle(
color: textColor
          ),
      ),
      ),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: borderColor, width: 8.0)),
    );
  }
}
