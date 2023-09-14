import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:headlines/main.dart';
import 'bodypart.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navhome();
  }

  _navhome() async {
    await Future.delayed(Duration(milliseconds: 1500));
    getData();
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => MyHomePage())));
    print('done');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: AnimatedSplashScreen(
          splash: Icon(
            LineIcons.home,
            size: 100,
          ),
          splashIconSize: 100,
          nextScreen: MyHomePage(),
          splashTransition: SplashTransition.scaleTransition,
          pageTransitionType: PageTransitionType.fade,
        ),
      ),
    );
  }
}
