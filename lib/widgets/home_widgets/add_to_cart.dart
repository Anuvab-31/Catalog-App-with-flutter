import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/model/cart.dart';
import 'package:flutter_application_1/model/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  //final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;
    //final CatalogModel _catalog=(VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          // isInCart = isInCart.toggle();
          //final _catalog = CatalogModel();

          //_cart.catalog = _catalog;
          // _cart.add(catalog);
          AddMutation(catalog);
          //setState(() {});
        }
      },
      child: isInCart ? Icon(Icons.done) : Icon(Icons.shopping_cart_outlined),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xff403b58)),
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}
