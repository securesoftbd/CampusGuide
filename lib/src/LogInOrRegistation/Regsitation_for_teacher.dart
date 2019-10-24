import 'dart:io';

import 'package:campus_guide/src/LogInOrRegistation/LogInPage.dart';
import 'package:campus_guide/src/Teacher/Home.dart';
import 'package:campus_guide/src/Utils/Common.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registation_for_teacher extends StatefulWidget {

  final page;


  Registation_for_teacher({this.page});

  @override
  _Registation_for_teacherState createState() =>
      _Registation_for_teacherState();
}

class _Registation_for_teacherState extends State<Registation_for_teacher> {
  /*TextEditingController _name_controller;
  TextEditingController _depertment_controller;
  TextEditingController _designation_controller;
  TextEditingController _email_controller;
  TextEditingController _phone_number_controller;*/



  final list_depertment=[

    "CSE",
    "EEE",
    "BBA",
    "IT",

  ];



  final list_designation=[

    "Deen",
    "Lectures",
    "Senuior Teacher",
    "Chairman",
    "VC",
    "Jounior Teacher"

  ];

  final _name_controller = new TextEditingController();
  final _depertment_controller = new TextEditingController();
  final _designation_controller = new TextEditingController();
  final _email_controller = new TextEditingController();
  final _phone_number_controller = new TextEditingController();

  final _password_controller = new TextEditingController();
  final _confirm_password_controller = new TextEditingController();

   var _selected_depertmet="CSE";
   var _selected_designation="Teacher";


   bool onProgress_for_sing_up_button=false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var _selected_gender = 0;

  var _selected_campus = 0;



  File _profile_image;
  String _uploadedFileURL;

  @override
  Widget build(BuildContext context) {
/*
    if(onProgress_for_sing_up_button){

    }*/

    return SafeArea(
      child: new MaterialApp(
        home: new Scaffold(
          body:onProgress_for_sing_up_button==false? SingleChildScrollView(
            child: Center(
              child: new Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  _top_image(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Column(
                      children: <Widget>[
                        _name_depertment_designation_email(),
                        _depertment(),
                        _designation(),
                        _gender(),
                        _campus(),
                        SizedBox(
                          height: 40,
                        ),
                        _sing_up(),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ):Center(child: CircularProgressIndicator(),),
        ),
      ),
    );
  }


  Widget _depertment(){


    return Container(

      width: double.infinity,
      height: 50,

      child: Column(
        children: <Widget>[

          DropdownButton(

            isExpanded: true,

            hint: new Text(" ${_selected_depertmet}"),
            underline: Container(
              height: 1.0,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.transparent, width: 0.0))
              ),
            ),
            // value: _selected,
            items: list_depertment.map((String v) {
              return new DropdownMenuItem<String>(
                value: v,
                child: Text(v),
              );
            }).toList(),
            onChanged: ( newValue) {
              print(newValue);

              setState(() {
                _selected_depertmet = newValue;
              });
            },


          ),

          Divider(height: 1,color: Colors.black,)




        ],

      )
    );
  }

  Widget _designation(){


    return  Container(

        width: double.infinity,
        height: 50,

        child: Column(
          children: <Widget>[

            DropdownButton(

              isExpanded: true,

              hint: new Text(" ${_selected_designation}"),
              underline: Container(
                height: 1.0,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.transparent, width: 0.0))
                ),
              ),
              // value: _selected,
              items: list_designation.map((String v) {
                return new DropdownMenuItem<String>(
                  value: v,
                  child: Text(v),
                );
              }).toList(),
              onChanged: ( newValue) {
                print(newValue);

                setState(() {
                  _selected_designation = newValue;
                });
              },


            ),

            Divider(height: 1,color: Colors.black,)




          ],

        )
    );
  }

  Widget _top_image() {
    return  new Center(
      child: new Stack(
        children: <Widget>[
          InkWell(

            onTap: (){
              //uploadFile();
              chooseFile();

            },

            child: new Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:  _profile_image != null
                          ?  AssetImage(_profile_image.path)
                          : new NetworkImage(
                          "https://myrealdomain.com/images/black-outline-person-4.png"
                      )


                  )),
            ),
          ),
          ClipPath(
            clipper: new cut_image(),
            child: new Container(
              width: 100,
              height: 100,
              decoration:
              BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: new Icon(
                  Icons.image,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((img) {
      setState(() {
        _profile_image = img;
      });
    });



  }

  //                        _name_depertment_designation_email(_name_controller,_depertment_controller,_designation_controller,_email_controller,_phone_number_controller),

  Widget _name_depertment_designation_email() {
    return Column(
      children: <Widget>[
        new TextField(
          controller: _name_controller,
          decoration: InputDecoration(
            labelText: "Name",
            labelStyle: TextStyle(fontSize: 12),
          ),
        ),
        /*new TextField(
          controller: _depertment_controller,
          decoration: InputDecoration(
            labelText: "Depertment",
            labelStyle: TextStyle(fontSize: 12),
          ),
        ),
        TextField(
          controller: _designation_controller,
          decoration: InputDecoration(
            labelText: "Designation",
            labelStyle: TextStyle(fontSize: 12),
          ),
        ),*/
        TextField(
          controller: _email_controller,
          decoration: InputDecoration(
            labelText: "Email Id",
            labelStyle: TextStyle(fontSize: 12),
          ),
        ),
        new TextField(
            controller: _phone_number_controller,
            decoration: InputDecoration(
                labelText: "Phone Number",
                labelStyle: TextStyle(fontSize: 12),
                prefix: Text("+88 ")),
            keyboardType: TextInputType.number),



        TextField(
           controller: _password_controller,
           obscureText:true,
          decoration: InputDecoration(
            labelText: "Password",
            labelStyle: TextStyle(fontSize: 12),

          ),
        ),


        TextField(
          controller: _confirm_password_controller,
          obscureText:true,
          decoration: InputDecoration(
            labelText: "Confirm Password",
            labelStyle: TextStyle(fontSize: 12),

          ),
        ),


      ],
    );
  }

  Widget _gender() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 12,
        ),
        Text(
          "Gender",
          style: TextStyle(fontSize: 12),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    _selected_gender = 0;
                  });
                },
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: Center(
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(

                                  // press

                                  color: _selected_gender == 0
                                      ? Colors.green
                                      : Colors.white,
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Male"),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _selected_gender = 1;
                  });
                },
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: Center(
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(

                                  // press

                                  color: _selected_gender == 1
                                      ? Colors.green
                                      : Colors.white,
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Female"),
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(
          height: 1,
          color: Colors.black,
        )
      ],
    );
  }

  Widget _campus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 12,
        ),
        Text(
          "Campus",
          style: TextStyle(fontSize: 12),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            bottom: 10,
            top: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    _selected_campus = 0;
                  });
                },
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: Center(
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(

                                  // press

                                  color: _selected_campus == 0
                                      ? Colors.green
                                      : Colors.white,
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text("Main ", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _selected_campus = 1;
                  });
                },
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: Center(
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(

                                  // press

                                  color: _selected_campus == 1
                                      ? Colors.green
                                      : Colors.white,
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Parmenant ",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _selected_campus = 2;
                  });
                },
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: Center(
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(

                                  // press

                                  color: _selected_campus == 2
                                      ? Colors.green
                                      : Colors.white,
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text("Uttora ", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          color: Colors.black,
        )
      ],
    );
  }

  Widget _sing_up() {
    return Center(
      child: Container(
        width: 120,
        child: RaisedButton(
          onPressed: () {
            /* Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => Teacher_Home()));*/


            setState(() {

              onProgress_for_sing_up_button=true;


            });






            print("Name  ${_name_controller.text}");
            print("Depertment  ${_selected_depertmet}");
            print("Designation  ${_selected_depertmet}");
            print("Email   ${_email_controller.text}");
            print("Phone  ${_phone_number_controller.text}");
            print("Gender  ${_selected_gender}");
            print("Campus  ${_selected_campus}");

            if (_name_controller.text.isNotEmpty &&

                _email_controller.text.isNotEmpty &&
                _phone_number_controller.text.isNotEmpty && _confirm_password_controller.text.isNotEmpty && _password_controller.text.isNotEmpty) {



              if(_password_controller.text.length >= 6 && _password_controller.text==_confirm_password_controller.text){


                //_showDialog();



                setState(() {

                  onProgress_for_sing_up_button=true;

                });


                FirebaseDatabase.instance.reference().child(Common.ref_tacher).child(_phone_number_controller.text).once().then((teacher){

                  print("Snapshort value  ${teacher.value}");

                  FirebaseDatabase.instance.reference().child(Common.ref_student).child(_phone_number_controller.text).once().then((student){

                    print("Student value  ${student.value}");

                    if(teacher.value==null  && student.value==null){

                      FirebaseDatabase.instance
                          .reference()
                          .child(Common.ref_tacher)
                          .child(_phone_number_controller.text)
                          .child(Common.ref_teacher_profile)
                          .set({
                        "Name": _name_controller.text,
                        "Phone Number": _phone_number_controller.text,
                        "Depertment": _selected_depertmet,
                        "Designation": _selected_designation,
                        "Email": _email_controller.text,
                        "Gender": _selected_gender,
                        "Campus": _selected_campus,
                        "Password":_password_controller.text,
                        "user":"teacher",
                      }).then((_) {
                        print("Success ");




                        uploadFile();





                      }).catchError((e) {
                        print("Error   ${e}");


                      });

                    }else{




                      setState(() {

                        onProgress_for_sing_up_button=false;

                      });

                      _show_dialog("You Are Alrady Register ");


                    }




                  });






                });



              }else{

                _show_dialog("Password Format is not correct !!!");

              /*  setState(() {

                  onProgress_for_sing_up_button=false;

                });*/


              }



            } else {
              _show_dialog("Please Fillup All Filed ");



            }
          },
          child: Text(
            "Sing Up",
          ),
          color: Colors.green,
        ),
      ),
    );
  }



  Future uploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().toString()}');
    StorageUploadTask uploadTask = storageReference.putFile(_profile_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;



        print("Image Urlllllllllllllll   $_uploadedFileURL ");
      });



      FirebaseDatabase.instance
          .reference()
          .child("Teacher")
          .child(_phone_number_controller.value.text)
          .child(Common.ref_teacher_profile)
          .update({
         "Image": _uploadedFileURL!=null ? _uploadedFileURL : "",
      }).then((_) {
        print("Image upload  Success");

        setState(() {

          onProgress_for_sing_up_button=false;

        });



        _set_logIn_info_to_shereprefarance_teacher(_phone_number_controller.value.text);




/*
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => Teacher_Home(number:_phone_number_controller.value.text,)));*/


        Navigator
            .of(context)
            .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => Teacher_Home(number: _phone_number_controller.value.text)));




        // Navigator.pop(context);
      }).catchError((e) {
        print(e);
      });



    });
  }


  void _show_dialog(String _dialog_body ) {
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



}


class cut_image extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(0.0, size.height / 2);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
