import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_to_cart.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Products Detail",
        ),
        centerTitle: true,
        backgroundColor: Color(0Xfff5f5f5),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ),
      backgroundColor: Color(0Xfff5f5f5),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${catalog.price}",
              style: TextStyle(
                  color: Colors.red[800],
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily),
            ),
            Container(
                width: 120,
                height: 40,
                child: AddToCart(
                  catalog: catalog,
                ))
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Container(
                height: 150,
                child: Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image),
                ),
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(
                          MediaQuery.of(context).size.width, 80))),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        catalog.name,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.poppins().fontFamily),
                      ),
                      Text(
                        catalog.des,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: GoogleFonts.poppins().fontFamily),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type passages.",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            fontFamily: GoogleFonts.poppins().fontFamily),
                      ),
                    ]),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
