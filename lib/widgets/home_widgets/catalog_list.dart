import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_detail.dart';
import 'package:flutter_application_1/model/catalog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20),
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeDetailPage(
                                catalog: catalog,
                              ))),
                  child: CatalogItem(catalog: catalog));
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeDetailPage(
                                catalog: catalog,
                              ))),
                  child: CatalogItem(catalog: catalog));
            },
          );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(
          image: catalog.image,
        ),
      ),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            catalog.name,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily),
          ),
          Text(
            catalog.des,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                fontFamily: GoogleFonts.poppins().fontFamily),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${catalog.price}",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
              AddToCart(catalog: catalog)
            ],
          )
        ],
      ).p(context.isMobile ? 0 : 20))
    ];

    ////extracting local variable
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).cardColor,
        ),
        margin: EdgeInsets.only(bottom: 16),
        height: 130,
        child: context.isMobile
            ? Row(
                children: children2,
              )
            : Column(
                children: children2,
              ));
  }
}
