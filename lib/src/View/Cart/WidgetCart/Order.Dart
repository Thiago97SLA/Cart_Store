import 'package:flutter/material.dart';
import 'package:carrito_de_compras/src/View/Home/Home.Dart';
import 'package:carrito_de_compras/src/Widget/WidgetFont.Dart';
import 'package:carrito_de_compras/src/View/Cart/WidgetCart/AlertBuy.Dart';

Widget alertcart(BuildContext context, dynamic listcart) {
  double width = MediaQuery.of(context).size.width;
  DateTime fecha = DateTime.now();

  return AlertDialog(
    title: Container(
      height: 400,
      width: 200,
      child: ListView(
        primary: false,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              width: width,
              color: Colors.grey[200],
              child: WidgetFont(
                  textAlign: TextAlign.center,
                  text: 'Orden',
                  size: 18,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: width * 0.3,
                    child: WidgetFont(
                        textAlign: TextAlign.start,
                        text: 'Fechas:',
                        size: 18,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600)),
                Container(
                    width: width * 0.3,
                    child: WidgetFont(
                        textAlign: TextAlign.end,
                        text: '${fecha.day}/${fecha.month}/${fecha.year}',
                        size: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: width * 0.3,
                    child: WidgetFont(
                        textAlign: TextAlign.start,
                        text: 'Hora:',
                        size: 18,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600)),
                Container(
                    width: width * 0.3,
                    child: WidgetFont(
                        textAlign: TextAlign.end,
                        text: '${fecha.hour}:${fecha.minute}:${fecha.second}',
                        size: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey[400]),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemCount: listcart.length,
              itemBuilder: (context, index) {
                dynamic data = listcart[index];
                if (data['quantity'] == 0) {
                  return Container();
                } else {
                  return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  width: width * 0.3,
                                  child: WidgetFont(
                                      textAlign: TextAlign.start,
                                      text: 'Producto:',
                                      size: 18,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w600)),
                              Container(
                                  width: width * 0.2,
                                  child: WidgetFont(
                                      textAlign: TextAlign.end,
                                      text: data['name'],
                                      size: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  width: width * 0.3,
                                  child: WidgetFont(
                                      textAlign: TextAlign.start,
                                      text: 'Cantidad:',
                                      size: 18,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w600)),
                              Container(
                                  width: width * 0.2,
                                  child: WidgetFont(
                                      textAlign: TextAlign.end,
                                      text: data['quantity'].toString(),
                                      size: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  width: width * 0.3,
                                  child: WidgetFont(
                                      textAlign: TextAlign.start,
                                      text: 'SkU:',
                                      size: 18,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w600)),
                              Row(
                                children: [
                                  Container(
                                      width: width * 0.2,
                                      child: WidgetFont(
                                          textAlign: TextAlign.end,
                                          text: data['sku'].toString(),
                                          size: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ));
                }
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(height: 1, color: Colors.grey[300]),
                );
              },
            ),
          )
        ],
      ),
    ),
    actions: [
      Container(
        width: width,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
              showDialog(
                  context: context, builder: (context) => alertBuy(context));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: WidgetFont(
                  textAlign: TextAlign.center,
                  text: 'Comprar',
                  size: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.deepOrange[600],
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
          ),
        ),
      )
    ],
  );
}
