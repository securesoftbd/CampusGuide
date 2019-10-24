import 'package:campus_guide/src/Teacher/Model/TeacherInfo.dart';
import 'package:campus_guide/src/Teacher/Profile.dart';
import 'package:campus_guide/src/Utils/Common.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:overlay_container/overlay_container.dart';
import 'Add_Councilling_hour.dart';

//import 'package:path/path.dart';
import 'dart:io';

class Edit_profile extends StatefulWidget {
  final number;

  Edit_profile({this.number});

  @override
  _Edit_profileState createState() => _Edit_profileState();



}

class _Edit_profileState extends State<Edit_profile> {
  final _edit_name_contoller = TextEditingController();

  final _edit_depertment_contoller = TextEditingController();

  final _edit_designation_contoller = TextEditingController();

  final _edit_gmail_contoller = TextEditingController();

  final _edit_phone_number_contoller = TextEditingController();
  final _edit_off_day_contoller=TextEditingController();


  final _edit_rom_number_contoller=TextEditingController();



  String _current_depertment = TeacherInfo.depertment;
  String _current_degicnation = TeacherInfo.designation;

  var _selected_gender = 0;

  var _selected_campus = 0;

  bool isClicked = false;

  bool _dropdownShown_for_depertment = false;
  bool _dropdownShown_for_degicnation = false;

  void _toggleDropdown_for_depertment() {
    setState(() {
      _dropdownShown_for_depertment = !_dropdownShown_for_depertment;
    });
  }

  void _toggleDropdown_for_degicanantion() {
    setState(() {
      _dropdownShown_for_degicnation = !_dropdownShown_for_degicnation;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _edit_name_contoller.text = TeacherInfo.name;
    _edit_depertment_contoller.text = TeacherInfo.depertment;
    _edit_designation_contoller.text = TeacherInfo.designation;
    _edit_gmail_contoller.text = TeacherInfo.email;
    _edit_phone_number_contoller.text = TeacherInfo.phone_number;

    _edit_off_day_contoller.text=TeacherInfo.off_day;

    _edit_rom_number_contoller.text= TeacherInfo.room_number;




    setState(() {
      _selected_campus = TeacherInfo.campus;

      _selected_gender = TeacherInfo.gender;
    });

  }

  // var ;

  File _profile_image;
  String _uploadedFileURL;

  String _profile_image_url;

  @override
  Widget build(BuildContext context) {


    getUserImage();


    print("_profile_image_url   ${_profile_image_url}");

    print(
        "Profileeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee  $_profile_image");
    print(
        "DownloadLinkkkkkkkkkkkkkkkkkkkkkkkkkkkkKkkkkkkkkkkkkkkkk  $_uploadedFileURL");

    return MaterialApp(
      home: Scaffold(



        appBar: AppBar(
          leading: InkWell(
              onTap: (){

                Navigator.pop(context);

              },

              child: new Icon(Icons.arrow_back,color: Colors.white,)),


          title: Text("Edit Profile"),

        ),



        body: ListView(
          children: <Widget>[
            image(),
            list(_edit_name_contoller, _edit_gmail_contoller,
                _edit_phone_number_contoller)
          ],
        ),
      ),
    );
  }

  getUserImage() async {
    await FirebaseDatabase.instance
        .reference()
        .child("Teacher")
        .child(widget.number)
        .child(Common.ref_teacher_profile)
        .child("Image")
        .once()
        .then((pp) {
      print("Callingggggggggggg....");

      if (pp.value != null) {
        print("PP ${pp.value}");

         setState(() {

          _profile_image_url = pp.value;

         });
      } else {
        print("Profile is not created");
      }
    }).catchError((e) {
      print("Error  $e");
    });
  }

  Widget image() {




    return new Center(
      child: new Stack(
        children: <Widget>[
          InkWell(
            onTap: () {
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
                      image: _profile_image_url!=null ?  NetworkImage(_profile_image_url)  :  NetworkImage("https://myrealdomain.com/images/black-outline-person-4.png"))),
              child: _profile_image != null
                  ? new Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(


                          shape: BoxShape.circle,

                          image: DecorationImage(


                              fit: BoxFit.cover,
                              image: FileImage(
                                _profile_image,
                              ))),
                    )
                  : new Container(),
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
        _profile_image_url = "";

        _profile_image = img;
      });
    });
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
          .child(widget.number)
          .child(Common.ref_teacher_profile)
          .update({
        "Image": _uploadedFileURL,
      }).then((_) {
        print("Success");

        Navigator.pop(context);
      }).catchError((e) {
        print(e);
      });
    });
  }

  Widget list(
          TextEditingController _edit_name_contoller,
          TextEditingController _edit_gmail_contoller,
          TextEditingController _edit_phone_number_contoller) =>
      new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          edit_name(_edit_name_contoller),
          edit_depertment(),
          dropdown_for_depertment(),
          edit_designation(),
          dropdown_for_degicnation(),
          edit_email_id(_edit_gmail_contoller),
          edit_phone_number(_edit_phone_number_contoller),
          edit_room_number(_edit_rom_number_contoller),
          edit_off_day(_edit_off_day_contoller),
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25.0, top: 5.0, bottom: 5.0),
            child: _gender(),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25.0, top: 5.0, bottom: 5.0),
            child: _campus(),
          ),
          edit_counsilling_hour(),
          SizedBox(
            height: 30,
          ),
          button()
        ],
      );

  Widget dropdown_for_depertment() => OverlayContainer(
        //key: ,
        show: _dropdownShown_for_depertment,
        // Let's position this overlay to the right of the button.
        position: OverlayContainerPosition(
          // Left position.
          25,
          // Bottom position.
          4,
        ),

        // The content inside the overlay.
        child: Container(
            height: 220,
            width: MediaQuery.of(context).size.width - 52,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 1,
                  spreadRadius: 2,
                )
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _current_depertment = "CSE";
                      _toggleDropdown_for_depertment();

                      print("Monu");
                    },
                    child: Text(
                      "CSE",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Divider(
                    height: 0.2,
                    color: Colors.black54,
                  ),
                  InkWell(
                    onTap: () {
                      _current_depertment = "EEE";
                      _toggleDropdown_for_depertment();
                    },
                    child: Text("EEE",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Divider(
                    height: 0.2,
                    color: Colors.black54,
                  ),
                  InkWell(
                    onTap: () {
                      _current_depertment = "BBA";

                      _toggleDropdown_for_depertment();
                    },
                    child: Text("BBA",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Divider(
                    height: 0.2,
                    color: Colors.black54,
                  ),
                  InkWell(
                    onTap: () {
                      _current_depertment = "SW";

                      _toggleDropdown_for_depertment();
                    },
                    child: Text("SW",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Divider(
                    height: 0.2,
                    color: Colors.black54,
                  ),
                  InkWell(
                    onTap: () {
                      _current_depertment = "BBA";

                      _toggleDropdown_for_depertment();
                    },
                    child: Text("MBA",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Divider(
                    height: 0.2,
                    color: Colors.black54,
                  ),
                  InkWell(
                    onTap: () {
                      _current_depertment = "CSE";
                      _toggleDropdown_for_depertment();
                    },
                    child: Text("CSE",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Divider(
                    height: 0.2,
                    color: Colors.black54,
                  ),
                  InkWell(
                    onTap: () {
                      _current_depertment = "EEE";

                      _toggleDropdown_for_depertment();
                    },
                    child: Text("EEE",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Divider(
                    height: 0.2,
                    color: Colors.black54,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _current_depertment = "BBA";

                        _toggleDropdown_for_depertment();
                      });
                    },
                    child: Text("BBA",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                ],
              ),
            )),
      );

  Widget dropdown_for_degicnation() => OverlayContainer(
        show: _dropdownShown_for_degicnation,
        // Let's position this overlay to the right of the button.
        position: OverlayContainerPosition(
          // Left position.
          25,
          // Bottom position.
          4,
        ),
        // The content inside the overlay.
        child: Container(
            height: 110,
            width: MediaQuery.of(context).size.width - 52,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 1,
                  spreadRadius: 2,
                )
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _toggleDropdown_for_degicanantion();

                      _current_degicnation = "Deen";
                    },
                    child: Text(
                      "Deen",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Divider(
                    height: 0.2,
                    color: Colors.black54,
                  ),
                  InkWell(
                    onTap: () {
                      _current_degicnation = "Sinior Teacher";
                      _toggleDropdown_for_degicanantion();
                    },
                    child: Text("Sinior Teacher",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Divider(
                    height: 0.2,
                    color: Colors.black54,
                  ),
                  InkWell(
                    onTap: () {
                      _current_degicnation = "Jounior Teacher";
                      _toggleDropdown_for_degicanantion();
                    },
                    child: Text("Jounior Teacher",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Divider(
                    height: 0.2,
                    color: Colors.black54,
                  ),
                  InkWell(
                    onTap: () {
                      _current_degicnation = "Acconts";
                      _toggleDropdown_for_degicanantion();
                    },
                    child: Text("Acconts ",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                ],
              ),
            )),
      );

  Widget edit_name(TextEditingController _edit_name_contoller) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 25.0, right: 25.0, top: 3, bottom: 3),
      child: TextField(
        autofocus: true,
        controller: _edit_name_contoller,
        decoration: InputDecoration(
          labelText: "Name",
        ),
      ),
    );
  }

  Widget edit_depertment() {
    return InkWell(
      onTap: () {
        if (_dropdownShown_for_degicnation) {
          _dropdownShown_for_degicnation = false;
        }

        _toggleDropdown_for_depertment();
        //  _createOverlayEntry(context);
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 25.0, right: 25.0, top: 3, bottom: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Depertment",
              style: TextStyle(color: Colors.black54, fontSize: 12),
            ),
            Row(
              children: <Widget>[
                Expanded(child: Text(_current_depertment)),
                new Icon(Icons.arrow_drop_down),
              ],
            ),
            SizedBox(
              height: 2,
            ),
            Divider(
              height: 1,
              color: Colors.black54,
            )
          ],
        ),
      ),
    );
  }

  Widget edit_designation() {
    return InkWell(
      onTap: () {
        _dropdownShown_for_degicnation = false;

        if (_dropdownShown_for_depertment) {
          _dropdownShown_for_depertment = false;
        }

        _toggleDropdown_for_degicanantion();
        //  _createOverlayEntry(context);
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 25.0, right: 25.0, top: 3, bottom: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Degiscnation",
              style: TextStyle(color: Colors.black54, fontSize: 12),
            ),
            Row(
              children: <Widget>[
                Expanded(child: Text(_current_degicnation)),
                new Icon(Icons.arrow_drop_down),
              ],
            ),
            SizedBox(
              height: 2,
            ),
            Divider(
              height: 1,
              color: Colors.black54,
            )
          ],
        ),
      ),
    );
  }

  Widget edit_email_id(TextEditingController _edit_gmail_contoller) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 25.0, right: 25.0, top: 3, bottom: 3),
      child: TextField(
        autofocus: true,
        controller: _edit_gmail_contoller,
        decoration: InputDecoration(
          labelText: "Eamil id",
        ),
      ),
    );
  }

  Widget edit_phone_number(TextEditingController _edit_phone_number_contoller) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 25.0, right: 25.0, top: 3, bottom: 3),
      child: TextField(
        autofocus: true,
        controller: _edit_phone_number_contoller,
        decoration: InputDecoration(
          labelText: "Phone number",
        ),
      ),
    );
  }


  Widget edit_off_day(TextEditingController _edit_phone_number_contoller) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 25.0, right: 25.0, top: 3, bottom: 3),
      child: TextField(
        autofocus: true,
        controller: _edit_off_day_contoller,
        decoration: InputDecoration(
          labelText: "Off Day",
        ),
      ),
    );
  }




  Widget edit_room_number(TextEditingController _edit_phone_number_contoller) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 25.0, right: 25.0, top: 3, bottom: 3),
      child: TextField(
        autofocus: true,
        controller: _edit_rom_number_contoller,
        decoration: InputDecoration(
          labelText: "Room number",
        ),
      ),
    );
  }


  Widget edit_counsilling_hour() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 25.0, right: 25.0, top: 3, bottom: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Conslling Hour",
            style: TextStyle(color: Colors.black54, fontSize: 12),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 140.0),
              child: InkWell(
                onTap: () {
                  // Navigator.pop(context);

                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => Add_Councilling_Hour(
                              initial_state: "ok", number: widget.number)));
                },
                child: new Card(
                  elevation: 4,
                  child: Container(
                    width: 70,
                    height: 30,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: new Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            "Add",
                            style: TextStyle(color: Colors.blueAccent),
                          )),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.access_alarm,
                            color: Colors.blueAccent,
                            size: 15,
                          )
                        ],
                      ),
                    )),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Divider(
            height: 1,
            color: Colors.black54,
          )
        ],
      ),
    );
  }

  Widget button() {
    return Center(
      child: Container(
        width: 120,
        child: RaisedButton(
          onPressed: () {
            // Navigator.push(context, new MaterialPageRoute(builder: (context)=>Teacher_Home()));

            print(" Teacher number iss  ${widget.number}");
            FirebaseDatabase.instance
                .reference()
                .child("Teacher")
                .child(widget.number)
                .child(Common.ref_teacher_profile)
                .update({
              "Campus": _selected_campus,
              "Depertment": _current_depertment,
              "Designation": _current_degicnation,
              "Email": _edit_gmail_contoller.text,
              "Gender": _selected_gender,
              "Name": _edit_name_contoller.text,
              "RoomNumber": _edit_rom_number_contoller.text,
              "OffDay":_edit_off_day_contoller.text
            }).then((_) {
              print("Success");

              if (_profile_image != null) {
                uploadFile();
              } else {
                Navigator.pop(context);
              //  Navigator.of(context).push(new MaterialPageRoute(builder: (contest)=>Profile(name: _edit_name_contoller.text, depertment: _current_depertment, designation: _current_degicnation, email: _edit_gmail_contoller.text,phone_number: _edit_phone_number_contoller.text,gender:_selected_gender,campus: _selected_campus,room_number: _edit_rom_number_contoller.text,off_day: _edit_off_day_contoller.text,)));

              }
            }).catchError((e) {
              print(e);
            });
          },
          child: Text(
            "Update",
          ),
          color: Colors.green,
        ),
      ),
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
                    Text("Uttora", style: TextStyle(fontSize: 12)),
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

class CustomPopupMenu {
  CustomPopupMenu({
    this.title,
  });

  String title;
}

class GroupModel {
  String text;
  int index;

  GroupModel({this.text, this.index});
}

class CampusGroupModel {
  String text;
  int index;

  CampusGroupModel({this.text, this.index});
}
