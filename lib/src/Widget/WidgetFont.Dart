import 'package:flutter/material.dart';

class WidgetFont extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  const WidgetFont({
    Key key,
    this.text,
    this.color,
    this.size,
    this.fontWeight,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Montserrat',
        fontWeight: fontWeight,
      ),
    );
  }
}
