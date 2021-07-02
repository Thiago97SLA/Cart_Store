import 'package:flutter/material.dart';
import 'package:carrito_de_compras/src/Widget/WidgetFont.Dart';

Widget appBarCart(context) {
  return AppBar(
    backgroundColor: Colors.pink[900],
    title: Container(
      alignment: Alignment.center,
      child: WidgetFont(
          textAlign: TextAlign.center,
          text: 'CARRITO DE COMPRAS',
          size: 18,
          color: Color(0xFFffffff),
          fontWeight: FontWeight.w600),
    ),
    actions: [
      Container(
        width: 50,
      )
    ],
  );
}
