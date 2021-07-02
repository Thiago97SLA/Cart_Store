import 'package:flutter/material.dart';
import 'package:carrito_de_compras/src/Widget/WidgetFont.Dart';

Widget alertBuy(context) {
  double width = MediaQuery.of(context).size.width;
  return AlertDialog(
    title: WidgetFont(
        textAlign: TextAlign.center,
        text: 'Gracias por su compra',
        size: 18,
        color: Colors.green,
        fontWeight: FontWeight.w600),
    actions: [
      Container(
        width: width * 0.65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: WidgetFont(
                    textAlign: TextAlign.center,
                    text: 'Ok',
                    size: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.green[600],
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
            )
          ],
        ),
      )
    ],
  );
}
