import 'dart:async';

import 'package:campus_guide/src/ChooseTeacherOrStudent.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {




  void navigationPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TeacherOrStudent()),
    );
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();


  }


  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}


class SplashScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {



    return MaterialApp(

      home: Scaffold(
        backgroundColor: Colors.green,
         body: Center(
           child: Container(
             width: 150,
             height: 150,
             decoration: BoxDecoration(
                 color: Colors.amber,
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.all(Radius.circular(10))
             ),
           ),

         ) ,
      ),
    );
  }
}
