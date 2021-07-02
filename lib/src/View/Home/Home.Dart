import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:carrito_de_compras/src/View/Cart/Cart.Dart';
import 'package:carrito_de_compras/src/Widget/WidgetFont.Dart';
import 'package:carrito_de_compras/src/Bloc/BlocStateCart.Dart';
import 'package:carrito_de_compras/src/Widget/Alerts/AlertShop.Dart';
import 'package:carrito_de_compras/src/View/Home/WidgetHome/ItemContainer.Dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> listcart = [];
  final blocStateCart = BlocStateCart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[900],
        title: Container(
            alignment: Alignment.center,
            child: WidgetFont(
                textAlign: TextAlign.center,
                text: 'CARRITO DE COMPRAS',
                size: 18,
                color: Color(0xFFffffff),
                fontWeight: FontWeight.w600)),
        actions: [
          FlatButton(
            onPressed: () {
              if (listcart.length != 0) {
                setState(() {
                  blocStateCart.evetSink.add(StatusCart.Pending);
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Cart(listcart: listcart)),
                );
              } else {
                showDialog(context: context, builder: (context) => alertcart());
              }
            },
            child: Icon(
              Icons.shopping_cart,
              size: 26,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
      body: ListView(
        children: [
          StreamBuilder(
            stream: blocStateCart.evetStream,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              print(snapshot.hasData);
              if (!snapshot.hasData) {
                return Container(
                  child: WidgetFont(
                      textAlign: TextAlign.center,
                      text: 'Agrega Produnctos',
                      size: 18,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w600),
                );
              }
              return Container(
                child: WidgetFont(
                    textAlign: TextAlign.center,
                    text: snapshot.data.toString(),
                    size: 18,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w600),
              );
            },
          ),
          Container(
            color: Colors.white,
            child: StreamBuilder(
                stream: Firestore.instance.collection('1').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
                  if (!snapshots.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<DocumentSnapshot> docs = snapshots.data.documents;
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data = docs[index].data;

                      return ItemContainer(data: data, listcart: listcart);
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
