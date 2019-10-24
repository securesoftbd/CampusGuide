import 'package:campus_guide/src/LogInOrRegistation/RegistationPage.dart';
import 'package:campus_guide/src/Student/Home.dart';
import 'package:campus_guide/src/Teacher/Home.dart';
import 'package:campus_guide/src/Utils/Common.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  final page;

  LogIn({this.page});

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _number_controller = new TextEditingController();
  final _password_controller = new TextEditingController();

  bool isShown = false;

 // bool onProgress=false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Image.network(
                "https://image.slidesharecdn.com/presentationondiiufarhanalvee-180406171636/95/daffodil-international-university-2018-1-638.jpg?cb=1523035239",
                height: 200,
                width: 200,
              ),
              SizedBox(height: 70),
              log_in_form(),
              SizedBox(
                height: 20,
              ),
              log_in_button(),
              SizedBox(
                height: 10,
              ),
              sing_up_button()
            ],
          ),
        )
      ),
    );
  }

  Widget log_in_button() {
    return Container(

      width: 210,
      child: RaisedButton(
        textColor: Colors.green  ,
        color: Colors.white,
        onPressed: () {
          print("number  ${_number_controller.text}");

          print("password ${_password_controller.text}");




          if(widget.page=="student") {



            if (_number_controller.text.isNotEmpty &&
                _password_controller.text.isNotEmpty) {


              FirebaseDatabase.instance
                  .reference()
                  .child(Common.ref_student)
                  .child(_number_controller.text)
                  .child(Common.ref_student_basic_info)
                  .child("Password")
                  .once().then((data) {
                print("Password  for student ${data.value}");


                if (_password_controller.text.endsWith(data.value)) {
                  //   _set_logIn_info_to_shereprefarance(_number_controller.text);

                  student__set_logIn_info_to_shereprefarance(
                      _number_controller.text);

                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              Student_Home(number: _number_controller.text,)));
                } else {
                  _show_dialog("Password is not match !!!");
                }
              }).catchError((e) {
                print("Error");
              });


            } else{



              _show_dialog("Password Input Currect Email And Password !!!");



            }




          }else{



            if (_number_controller.text.isNotEmpty &&
                _password_controller.text.isNotEmpty) {






              FirebaseDatabase.instance
                  .reference()
                  .child(Common.ref_tacher)
                  .child(_number_controller.text)
                  .child(Common.ref_teacher_profile)
                  .child("Password")
                  .once()
                  .then((data) {
                print("Password is  ${data.value}");

                if (_password_controller.text.endsWith(data.value)) {

                  _set_logIn_info_to_shereprefarance_teacher(_number_controller.text);

                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => Teacher_Home(number: _number_controller.text,))
                  );
                } else {
                  /* _show_dialog("Password is not match !!!");*/


                  print("Studentt....");




                }
              }).catchError((e) {
                print(e);
              });
            }else{



              _show_dialog("Password Input Currect Email And Password !!!");



            }


          }


        },
        child: new Text("Log In"),
      ),
    );
  }

  Widget sing_up_button() {
    return Container(
      width: 210,
      child: RaisedButton(
        textColor: Colors.green,
        color: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      RegistationPage(widget.page)));
        },
        child: new Text("Sign Up"),
      ),
    );
  }

  Widget log_in_form() {
    return new Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _number_controller,
              decoration: InputDecoration(
                  labelText: "Enter your number",
                  labelStyle: TextStyle(fontSize: 12),
                  prefix: Text("+88 ")),
            ),


            TextField(
                controller: _password_controller,
                obscureText: isShown ? false : true,
                decoration: InputDecoration(
                  labelText: "Enter your password",
                  labelStyle: TextStyle(fontSize: 12),
                  suffixIcon: InkWell(
                      onTap: () {
                        if (isShown) {
                          setState(() {
                            isShown = false;
                          });
                        } else {
                          setState(() {
                            isShown = true;
                          });
                        }
                      },
                      child: isShown
                          ? Icon(Icons.remove_red_eye)
                          : Image.asset(
                              "Img/hide.png",
                              color: Colors.blueAccent,
                            )),
                ))
          ],
        ));
  }

  void _show_dialog(String _dialog_body) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Aleart"),
          content: new Text(_dialog_body),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _set_logIn_info_to_shereprefarance_teacher(String number) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString("log_in_info", number);
  }



  void student__set_logIn_info_to_shereprefarance(String number) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString("log_in_info_as_student", number);
  }

}
