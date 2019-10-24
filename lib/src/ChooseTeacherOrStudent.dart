import 'package:campus_guide/src/LogInOrRegistation/LogInOrRegistation.dart';
import 'package:campus_guide/src/Teacher/Home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherOrStudent extends StatelessWidget {







  @override
  Widget build(BuildContext context) {







    return MaterialApp(
      home: SafeArea(
        child: new Scaffold(
          backgroundColor: Colors.green,
          body: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                  ),
                  new RaisedButton(
                      color: Colors.teal,
                      child: Text("I am a student"),
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => RegistationOrLogIn(
                                      page: "student",
                                    )));
                      }),
                  new SizedBox(
                    height: 20,
                  ),
                  new Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                    ),
                  ),
                  new RaisedButton(
                    color: Colors.teal,
                    child: Text("I am a teacher"),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => RegistationOrLogIn(
                                    page: "teacher",
                                  )));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
