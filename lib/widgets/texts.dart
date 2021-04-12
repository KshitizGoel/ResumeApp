import 'package:flutter/material.dart';


class CustomTexts extends StatelessWidget {

  final String inputText;
  final Color color;
  final bool boldness;
  final double fontSize ;
  CustomTexts(this.inputText , this.boldness ,this.fontSize , this.color);

  @override
  Widget build(BuildContext context) {
    return Text(
      inputText,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: color, fontSize: fontSize, fontWeight: boldness  ?FontWeight.w700  :FontWeight.normal)
    );
  }
}
