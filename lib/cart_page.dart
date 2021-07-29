import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/cart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import 'core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: Color(0xfff5f5f5),
        title: Text("Cart"),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
              child:
                  Container(padding: EdgeInsets.all(16), child: _CartList())),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  //final _cart = CartModel();
  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context, store, status) {
              return Text(
                "\$${_cart.totalPrice}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              );
            },
          ),
          SizedBox(width: 30),
          Container(
            height: 40,
            width: 120,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Buying Not Supported Yet")));
              },
              child: Text(
                "Buy",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff403b58)),
                  shape: MaterialStateProperty.all(StadiumBorder())),
            ),
          )
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    //final _cart = CartModel();
    return _cart.items.isEmpty
        ? Center(
            child: Text(
              "Nothing To Show",
              textScaleFactor: 1.7,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      RemoveMutation(_cart.items[index]);
                      //setState(() {});
                    },
                  ),
                  title: Text(_cart.items[index].name),
                ));
  }
}
 