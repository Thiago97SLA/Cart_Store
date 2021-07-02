import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:carrito_de_compras/src/Bloc/Providersstate.Dart';
import 'package:carrito_de_compras/src/Widget/WidgetFont.Dart';
import 'package:carrito_de_compras/src/View/Cart/WidgetCart/Order.Dart';
import 'package:carrito_de_compras/src/View/Cart/WidgetCart/AppBarCart.Dart';

class Cart extends StatefulWidget {
  List<Map<String, dynamic>> listcart;
  Cart({Key key, this.listcart}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final valglobal = Provider.of<Providersstate>(context, listen: false);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: appBarCart(context),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            primary: true,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: WidgetFont(
                    textAlign: TextAlign.center,
                    text: 'Lista de Produtos',
                    size: 20,
                    color: Colors.grey[850],
                    fontWeight: FontWeight.w600),
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: widget.listcart.length,
                itemBuilder: (context, index) {
                  var quantity = Map<String, int>();
                  if (widget.listcart[index]['quantity'].toString() == 'null') {
                    widget.listcart[index]['quantity'] = 1;
                  }

                  widget.listcart[index].addAll(quantity);
                  return Container(
                    width: width,
                    margin: EdgeInsets.symmetric(
                        horizontal: width * 0.025, vertical: height * 0.0005),
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.0010, vertical: height * 0.008),
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: WidgetFont(
                                    textAlign: TextAlign.center,
                                    text: 'iD del producto',
                                    size: 15,
                                    color: Colors.grey[850],
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                width: 50,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: WidgetFont(
                                    textAlign: TextAlign.center,
                                    text:
                                        widget.listcart[index]['id'].toString(),
                                    size: 15,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: WidgetFont(
                                    textAlign: TextAlign.center,
                                    text: 'Nombre del Produto:',
                                    size: 18,
                                    color: Colors.grey[850],
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: WidgetFont(
                                    textAlign: TextAlign.center,
                                    text: widget.listcart[index]['name'],
                                    size: 18,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: WidgetFont(
                                    textAlign: TextAlign.center,
                                    text: 'Cantidad',
                                    size: 18,
                                    color: Colors.grey[850],
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                width: width * 0.4,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        setState(() {
                                          if (widget.listcart[index]
                                                  ['quantity'] !=
                                              0) {
                                            widget.listcart[index]
                                                ['quantity']--;
                                          }
                                        });
                                      },
                                      color: Colors.yellow,
                                    ),
                                    Text(
                                        '${widget.listcart[index]['quantity']}',
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22.0,
                                            color: Colors.black)),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          widget.listcart[index]['quantity']++;
                                        });
                                      },
                                      color: Colors.yellow,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) =>
                          alertcart(context, widget.listcart));
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
          ),
        ],
      ),
    );
  }
}
