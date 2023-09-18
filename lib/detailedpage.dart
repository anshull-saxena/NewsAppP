import 'package:flutter/material.dart';
import 'main.dart';
import 'package:headlines/themes.dart';
import 'package:headlines/bodypart.dart';
import 'package:line_icons/line_icons.dart';

class detailedInfo extends StatefulWidget {
  final index;

  const detailedInfo({super.key, required this.index});

  @override
  State<detailedInfo> createState() => _detailedInfoState();
}

class _detailedInfoState extends State<detailedInfo> {
  bool isReadMore = false;
double _height=150;
  @override

  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color(0xffe9ecef),
        body: Stack(
          alignment: Alignment.bottomRight,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                    tag: 'nice${widget.index}',
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: NetworkImage(Urls[widget.index]))),
                      alignment: Alignment.bottomRight,
                      width: double.infinity,
                      height: 300,
                      padding: EdgeInsets.all(20),
                      child: Text(
                        Titles[widget.index],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                offset: Offset(2, 2),
                                blurRadius: 15),
                            Shadow(
                                color: Colors.black,
                                offset: Offset(2, 2),
                                blurRadius: 15),
                          ],
                          wordSpacing: 1,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      // maxLines: readMore ? 10 : 2,
                      Bodyy[widget.index],
                      style: TextStyle(height: 1.5, fontSize: 20),
                    ),
                    width: double.infinity,
                    height: _height,
                    color: Color(0xffe9ecef),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(Color(0xffe9ecef))
                  ),
                      onPressed: (){
                    setState(() {
  _height = double.maxFinite;
                  });}, child: Text('read more', style: TextStyle(fontSize: 20,
                      color: Colors.black),
                  ),

                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade500,
                      offset: Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-3, -3),
                      blurRadius: 15,
                      spreadRadius: 1)
                ],
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              margin: EdgeInsets.all(40),
              height: 50,
              width: 50,
              alignment: Alignment.center,
              child: BackButton(
                style: ButtonStyle(
                  alignment: Alignment.center,
                ),
              ),
            )
          ],
        ));
  }
}
