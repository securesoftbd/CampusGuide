import 'package:campus_guide/src/LogInOrRegistation/LogInPage.dart';
import 'package:flutter/material.dart';

class RegistationOrLogIn extends StatelessWidget {

  final  page;

  RegistationOrLogIn({this.page});
  
  


  @override
  Widget build(BuildContext context) {
    print(page);
    return new MaterialApp(
      home: new Registation_Page(page),
    );
  }
}

class Registation_Page extends StatefulWidget {

  final page;
  Registation_Page(this.page);

  @override
  _Registation_PageState createState() => _Registation_PageState();
}

class _Registation_PageState extends State<Registation_Page> {
  @override
  Widget build(BuildContext context) {
    return LogIn(page: widget.page,);
  }
}





