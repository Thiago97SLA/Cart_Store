import 'package:flutter/material.dart';
import 'package:carrito_de_compras/src/Widget/WidgetFont.Dart';

Container pagoTotal(List<Map<String, dynamic>> listCart) {
  return Container(
    alignment: Alignment.centerRight,
    padding: EdgeInsets.only(left: 120),
    height: 70,
    width: 400,
    color: Colors.grey[200],
    child: Row(
      children: [
        WidgetFont(
            textAlign: TextAlign.center,
            text: 'Total: ',
            size: 18,
            color: Color(0xFFffffff),
            fontWeight: FontWeight.w600)
      ],
    ),
  );
}
