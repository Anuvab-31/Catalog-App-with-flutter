import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Catalog App",
            style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily)),
        Text("Trending Products",
            style: TextStyle(
                fontSize: 15, fontFamily: GoogleFonts.poppins().fontFamily)),
      ],
    );
  }
}
