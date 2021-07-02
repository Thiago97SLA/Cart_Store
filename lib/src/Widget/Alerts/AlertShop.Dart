import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carrito_de_compras/src/Widget/WidgetFont.Dart';

Widget alertcart() {
  return AlertDialog(
      title: WidgetFont(
          textAlign: TextAlign.center,
          text: 'Selecciona un producto',
          size: 18,
          color: Colors.redAccent,
          fontWeight: FontWeight.w600));
}
