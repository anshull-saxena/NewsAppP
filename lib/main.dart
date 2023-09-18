import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:headlines/detailedpage.dart';
import 'package:headlines/infopage.dart';
import 'bodypart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:headlines/splash.dart';
import 'package:headlines/themes.dart';

int count = 10;
void main() {
  runApp(const MyApp());
  count = 10;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [NewsPage(), InfoPage()];
  void _onPageChanged(int index) {}

  void _onTabChange(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        bottomNavigationBar: GNav(
            onTabChange: _onTabChange,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            backgroundColor: Colors.black,
            activeColor: Color(0xffe9ecef),
            color: Color(0xffe9ecef),
            textStyle: TextStyle(fontSize: 19, color: Color(0xffe9ecef)),
            iconSize: 26,
            padding: EdgeInsets.fromLTRB(30, 30, 30, 40),
            tabs: [
              GButton(
                iconSize: 30,
                icon: LineIcons.home,
                iconColor: Color(0xffe9ecef),
                iconActiveColor: Color(0xffe9ecef),
                text: "News",
                textStyle: TextStyle(
                    color: Color(0xffe9ecef),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
                gap: 15,
              ),
              GButton(
                iconSize: 30,
                icon: LineIcons.infoCircle,
                iconActiveColor: Color(0xffe9ecef),
                iconColor: Color(0xffe9ecef),
                text: "About Us",
                textStyle: TextStyle(
                    color: Color(0xffe9ecef),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
                gap: 12,
              )
            ]),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "News App   ",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                ),
              ),
              // ElevatedButton(onPressed:(){},
              //   style: ElevatedButton.styleFrom(
              //     elevation: 0,
              //       backgroundColor: Colors.white70
              //   ),
              //   child: Icon(Icons.menu_rounded,size: 30,color: Colors.black45),
              //
              // )
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          children: _screens,
          onPageChanged: _onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                  count,
                  (index) => ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xffe9ecef))),
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        detailedInfo(index: index)));

                            //zoom
                            // _width = 800;
                          });
                        },
                        child: Hero(
                          tag: 'nice${index}',
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade500,
                                      offset: Offset(4, 4),
                                      blurRadius: 15,
                                      spreadRadius: 1),
                                  BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-5, -5),
                                      blurRadius: 15,
                                      spreadRadius: 1)
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(Urls[index]),
                                  fit: BoxFit.fitHeight,
                                ),
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(20)),
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                            child: Text(
                              Titles[index],
                              style: TextStyle(
                                  shadows: [
                                    Shadow(blurRadius: 15),
                                    Shadow(blurRadius: 100, color: Colors.grey)
                                  ],
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.fade,
                                  fontSize: 20),
                            ),
                            alignment: Alignment.bottomCenter,
                            width: double.maxFinite,
                            height: 220,
                          ),
                        ),
                      )),
            ),
          ),
        ),
        Visibility(
          visible: count < 20,
          child: IconButton(
              iconSize: 40,
              onPressed: () {
                setState(() {
                  if (count < 20) {
                    count += 10;
                  } else {}
                });
              },
              icon: Icon(LineIcons.arrowCircleDown)),
        )
      ],
    );
  }
}
