import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:headlines/infopage.dart';
import 'bodypart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xff282c33),
        )
      ),
  home: const MyHomePage(),
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
  List<Widget> _screens = [
    NewsPage(),InfoPage()
  ];
void _onPageChanged(int index){

}

void _onTabChange(int index){
_pageController.jumpToPage(index);
}
  @override
  void initState(){
  getData();
  super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar:
        GNav(
          onTabChange: _onTabChange,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            backgroundColor: Color(0xffe9ecef),
            activeColor: Color(0xffe9ecef),
            color: Color(0xffe9ecef),
            textStyle: TextStyle(fontSize: 19,color: Color(0xffe9ecef)),
            iconSize: 26,
            padding: EdgeInsets.fromLTRB(30, 30, 30, 40),
            tabs:[
          GButton(iconSize: 30, icon: LineIcons.home,iconColor: Colors.black, iconActiveColor: Colors.black, text: "News",textStyle: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500
          ),gap: 15,),
          GButton(iconSize: 30, icon: LineIcons.infoCircle,iconActiveColor: Colors.black, iconColor: Colors.black,text: "About Us",textStyle: TextStyle(

            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500
          ), gap: 12,)
        ] ),


        appBar: AppBar(
          backgroundColor: Color(0xffe9ecef),
          centerTitle: true,
          elevation: 0,
          title: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
         Padding(padding: EdgeInsets.fromLTRB(20,0,0,0),
             child:Text("News App   ",
               style: GoogleFonts.montserrat(
                 textStyle: TextStyle(
                   fontWeight: FontWeight.bold,
                     color: Colors.black54
                 ),
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
          ],),
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
    return SingleChildScrollView (
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate (10,
                  (index) => Container(

                    decoration:
                    BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade500,
                              offset: Offset(4,4),
                              blurRadius: 15,
                              spreadRadius: 1
                          ),
                          BoxShadow(
                              color:Colors.white,
                              offset: Offset(-5,-5),
                              blurRadius: 15,spreadRadius: 1)
                        ],
                    image: DecorationImage(image: NetworkImage(Urls[index]),
                      fit: BoxFit.fitHeight
                      ,),
                       color: Color(0xffe9ecef),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    margin: EdgeInsets.all(15),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    Titles[index],
                    style: TextStyle(
                      color: Colors.white,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.fade,
                        fontSize: 20
                    ),
                  ),
                ),
                alignment: Alignment.bottomCenter,

                width: 800,
                height: 220,
              ),
          ),
        ),
      )
    );
  }
}

class DetailedNewsPage extends StatelessWidget {
  const DetailedNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Text("gg"),
    );
  }
}