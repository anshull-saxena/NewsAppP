import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:headlines/main.dart';
import 'bodypart.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';

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
    getData();
    await Future.delayed(Duration(milliseconds: 2000));
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => MyHomePage())));
    print('done');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: AnimatedSplashScreen(
          splash: Lottie.asset('animations/logo.json'),
          splashIconSize: 350,
          nextScreen: MyHomePage(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
        ),
      ),
    );
  }
}
