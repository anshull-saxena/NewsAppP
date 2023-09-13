import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body:Container(
    width: 400,
    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Project Made for",style: GoogleFonts.montserrat(textStyle: TextStyle(
          fontSize: 20
        ))),
        Text("CRUx",
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
                letterSpacing: 5,
                fontSize: 60),
          ),
          textAlign:TextAlign.end ,)
      ],
    ),
decoration: BoxDecoration(
  color: Color(0xffe9ecef),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.shade500,
      offset: Offset(4,4),
      blurRadius: 15,
      spreadRadius: 1
    ),
    BoxShadow(
        color:Color(0xffe9ecef),
    offset: Offset(-5,-5),
    blurRadius: 15,spreadRadius: 1)
  ]
),
  )
    );
  }
}