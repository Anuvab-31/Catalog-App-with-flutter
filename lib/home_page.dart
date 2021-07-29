import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/model/cart.dart';
import 'package:flutter_application_1/model/catalog.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed((Duration(seconds: 2)));
    final catalogJson = await rootBundle.loadString("assets/files/file.json");
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xfff5f5f5),
          // backgroundColor: Theme.of(context).cardColor,
          floatingActionButton: VxBuilder(
              mutations: {AddMutation, RemoveMutation},
              builder: (context, store, status) {
                return VxBadge(
                  color: Colors.red[800],
                  size: 22,
                  count: _cart.items.length,
                  textStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  child: FloatingActionButton(
                    backgroundColor: Color(0xff403b58),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage())),
                    child: Icon(CupertinoIcons.cart),
                  ),
                );
              }),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHeader(),
                  if (CatalogModel.items.isNotEmpty)
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: CatalogList(),
                    ))
                  else
                    Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                ],
              ),
            ),
          ),
        ));
  }
}
