import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'dart:async';
import 'package:red_positive/maps.dart';

void main() => runApp(new Blood());

class Blood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new SplashScreen(),
      routes: <String , WidgetBuilder>{
        '/Maps': (BuildContext context) => new Maps()
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(milliseconds: 3750);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/Maps');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: FlareActor(
          "assets/pulse.flr",
          alignment: Alignment.center,
          fit: BoxFit.cover,
          animation: 'Heart',
        ),
      ),
    );
  }
}
