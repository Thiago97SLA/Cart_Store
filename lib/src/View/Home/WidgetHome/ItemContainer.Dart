import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carrito_de_compras/src/Widget/WidgetFont.Dart';
import 'package:carrito_de_compras/src/Bloc/Providersstate.Dart';
import 'package:carrito_de_compras/src/Bloc/BlocStateCart.Dart';

class ItemContainer extends StatefulWidget {
  final dynamic data;
  final List listcart;

  const ItemContainer({Key key, this.data, this.listcart}) : super(key: key);

  @override
  _ItemContainerState createState() => _ItemContainerState();
}

class _ItemContainerState extends State<ItemContainer> {
  final blocStateCart = BlocStateCart();
  @override
  Widget build(BuildContext context) {
    final providersstate = Provider.of<Providersstate>(context, listen: false);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.025, vertical: height * 0.01),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.0010, vertical: height * 0.008),
      child: Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.03),
                  width: width * 0.2,
                  child: WidgetFont(
                      text: widget.data['name'],
                      size: 20,
                      color: Color(0xFF0000000),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: WidgetFont(
                        text: 'Descripcion:',
                        size: 16,
                        color: Color(0xFF909090),
                        fontWeight: FontWeight.w600))
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: WidgetFont(
                  textAlign: TextAlign.justify,
                  text: widget.data['description'],
                  size: 14,
                  color: Color(0xFF909090),
                  fontWeight: FontWeight.w600),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: FlatButton(
                      child: (!widget.listcart.contains(widget.data))
                          ? Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      right: 10, bottom: 10),
                                  child: WidgetFont(
                                      textAlign: TextAlign.justify,
                                      text: 'Agregado al carrito',
                                      size: 14,
                                      color: Colors.amber[800],
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                      onPressed: () {
                        setState(() {
                          if (!widget.listcart.contains(widget.data)) {
                            widget.listcart.add(widget.data);
                          } else {
                            widget.listcart.remove(widget.data);
                            providersstate.setlistproducts = widget.listcart;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
