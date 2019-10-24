
import 'dart:io';

import 'package:campus_guide/src/LogInOrRegistation/OverllayDialog/CountriesField.dart';
import 'package:campus_guide/src/Student/Home.dart';
import 'package:campus_guide/src/Utils/Common.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LogInPage.dart';

class RegistationForStudent extends StatefulWidget {


  final page;

  final current_section;


  RegistationForStudent({this.page,this.current_section});

  @override
  _RegistationForStudentState createState() => _RegistationForStudentState();
}

class _RegistationForStudentState extends State<RegistationForStudent> {
  final _name_controller = new TextEditingController();
  final _depertment_controller = new TextEditingController();
  final _designation_controller = new TextEditingController();
  final _email_controller = new TextEditingController();
  final _phone_number_controller = new TextEditingController();

  final _password_controller = new TextEditingController();
  final _confirm_password_controller = new TextEditingController();
  final _student_id_controller=new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var _selected_gender = 0;

  var _selected_campus = 0;


  File _profile_image;
  String _uploadedFileURL;

  bool onProgress_for_sing_up_button;

  @override
  Widget build(BuildContext context) {



/*
   print("Current Section is   ${widget.current_section}");
   print("Current Section is  Common   ${Common.current_section}");
*/



    Future chooseFile() async {
      await ImagePicker.pickImage(source: ImageSource.gallery).then((img) {
        setState(() {
          _profile_image = img;
        });
      });



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




    return SafeArea(
      child: new MaterialApp(
        home: new Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: new Column(
                children: <Widget>[


                  _top_image(),

                  SizedBox(
                    height: 40,
                  ),
              //    _top_image(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Column(
                      children: <Widget>[
                        //new CountriesField(),
                        _name_depertment_designation_email(),
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
          ),
        ),
      ),
    );
  }

 /* Widget _top_image() {
    return Center(
      child: new Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://image.slidesharecdn.com/presentationondiiufarhanalvee-180406171636/95/daffodil-international-university-2018-1-638.jpg?cb=1523035239",
                ))),
      ),
    );
  }
*/
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
        new TextField(
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
        ),
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


        TextField(
          controller: _student_id_controller,
       //   obscureText:true,
          decoration: InputDecoration(
            labelText: "Student ID",
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
                    Text("Main", style: TextStyle(fontSize: 12)),
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
                      "Parmenant",
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

            print("Name  ${_name_controller.text}");
            print("Depertment  ${_depertment_controller.text}");
            print("Designation  ${_designation_controller.text}");
            print("Email   ${_email_controller.text}");
            print("Phone  ${_phone_number_controller.text}");
            print("Gender  ${_selected_gender}");
            print("Campus  ${_selected_campus}");

            if (_name_controller.text.isNotEmpty &&
                _designation_controller.text.isNotEmpty &&
                _depertment_controller.text.isNotEmpty &&
                _email_controller.text.isNotEmpty &&
                _phone_number_controller.text.isNotEmpty && _confirm_password_controller.text.isNotEmpty && _password_controller.text.isNotEmpty && _student_id_controller.text.isNotEmpty) {



              if(_password_controller.text.length >= 6 && _password_controller.text==_confirm_password_controller.text){

                FirebaseDatabase.instance.reference().child(Common.ref_student).child(_phone_number_controller.text).once().then((snap){

                  print("Snapshort value  ${snap.value}");


                  FirebaseDatabase.instance.reference().child(Common.ref_tacher).child(_phone_number_controller.text).once().then((teacher){




                    if(snap.value==null  && teacher.value==null){

                      FirebaseDatabase.instance
                          .reference()
                          .child(Common.ref_student)
                          .child(_phone_number_controller.text)
                          .child(Common.ref_student_basic_info)
                          .set({
                        "Name": _name_controller.text,
                        "Phone Number": _phone_number_controller.text,
                        "Depertment": _depertment_controller.text,
                        "Designation": _designation_controller.text,
                        "Email": _email_controller.text,
                        "Gender": _selected_gender,
                        "Campus": _selected_campus,
                        "Password":_password_controller.text,
                        "Section":Common.current_section,
                        "Student ID":_student_id_controller.text,
                        "user":"student",
                      }).then((_) {
                        print("Success ");



                        uploadFile();


                      /*  Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => LogIn(page: widget.page,)));*/

                      }).catchError((e) {
                        print("Error   ${e}");


                      });

                    }else{


                      _show_dialog("You Are Alrady Registered ");

                    }


                  });






                });



              }else{

                _show_dialog("Password Format is not correct !!!");

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
          .child(Common.ref_student)
          .child(_phone_number_controller.text)
          .child(Common.ref_student_basic_info)
          .update({
        "Image": _uploadedFileURL!=null ? _uploadedFileURL : "",
      }).then((_) {
        print("Image upload  Success");

        setState(() {

          onProgress_for_sing_up_button=false;

        });



        student__set_logIn_info_to_shereprefarance(_phone_number_controller.value.text);




/*
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => Teacher_Home(number:_phone_number_controller.value.text,)));*/


        Navigator
            .of(context)
            .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => Student_Home(number: _phone_number_controller.value.text)));




        // Navigator.pop(context);
      }).catchError((e) {
        print(e);
      });



    });
  }


  void student__set_logIn_info_to_shereprefarance(String number) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString("log_in_info_as_student", number);
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
