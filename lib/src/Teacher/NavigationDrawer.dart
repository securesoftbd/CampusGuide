import 'package:campus_guide/src/Global/Nav_Bus_Sedule.dart';
import 'package:campus_guide/src/Global/Nav_Club_Info.dart';
import 'package:campus_guide/src/Global/Nav_Teacher.dart';
import 'package:campus_guide/src/Teacher/Model/TeacherInfo.dart';
import 'package:campus_guide/src/Teacher/Profile.dart';
import 'package:campus_guide/src/Utils/Common.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ChooseTeacherOrStudent.dart';


class NavigationDrawer extends StatelessWidget {



  final number;


  NavigationDrawer({this.number});



  bool log_out_state=false;

  String _profile_image_url;



  getUserImage() async {
    await FirebaseDatabase.instance
        .reference()
        .child("Teacher")
        .child(number)
        .child(Common.ref_teacher_profile)
        .child("Image")
        .once()
        .then((pp) {
      print("Callingggggggggggg....");

      if (pp.value != null) {
        print("PP ${pp.value}");



          _profile_image_url = pp.value;


      } else {
        print("Profile is not created");
      }
    }).catchError((e) {
      print("Error  $e");
    });
  }

  @override
  Widget build(BuildContext context) {

    getUserImage();


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.transparent,
          
          

          
          body: Container(
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: <Widget>[ header(), Expanded(child: list(context))],
            ),
          )),
    );
  }

  Widget header (){

   return new Container(
      width: double.infinity,
      height: 200,
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(

                          _profile_image_url!=null ?_profile_image_url:"https://png.pngtree.com/svg/20170329/teacher_registration_300682.png"

                       //   TeacherInfo.user_image!=null ?  TeacherInfo.user_image : ""

                      ))),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Teacher",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );

  }

  Widget list(BuildContext context) => new ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[



          InkWell(
            onTap: () {
              Navigator.pop(context);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Profile(number: number)));
            },
            child: ListTile(
              leading: new Icon(
                Icons.perm_identity,
                color: Colors.green,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ),
          ListTile(
            leading: new Icon(
              Icons.notifications,
              color: Colors.green,
            ),
            title: Text(
              "Notification",
              style: TextStyle(color: Colors.green),
            ),
          ),
          InkWell(

            onTap: (){

              Navigator.pop(context);


              Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>Nav_Teacher()));

            },
            child: ListTile(
              leading: new Icon(
                Icons.pregnant_woman,
                color: Colors.green,
              ),
              title: Text(
                "Teacher",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ),
          InkWell(

            onTap: (){


              Navigator.pop(context);


              Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>BusSedule()));


            },

            child: ListTile(
              leading: new Icon(
                Icons.departure_board,
                color: Colors.green,
              ),
              title: Text(
                "Bus Scheadule",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ),
          InkWell(
            onTap: (){

              Navigator.pop(context);


              Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>ClubInfo()));



            },

            child: ListTile(
              leading: new Icon(
                Icons.perm_device_information,
                color: Colors.green,
              ),
              title: Text(
                "Club Information",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ),
          ListTile(
            leading: new Icon(
              Icons.map,
              color: Colors.green,
            ),
            title: Text(
              "Campus Map",
              style: TextStyle(color: Colors.green),
            ),
          ),
          InkWell(


            onTap: (){

              _log_out().then((v){
                if(v=="log_out_success"){
                  log_out_state=true;
                   Navigator.pop(context);
                   Navigator.push(context, new MaterialPageRoute(builder: (context)=>new TeacherOrStudent()));
                }
              });
            },
            child: ListTile(
              leading: new Icon(
                Icons.all_out,
                color: Colors.green,
              ),
              title: Text(
                "LogOut",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ),
        ],
      );

  Future<String> _log_out() async {
    SharedPreferences sp= await SharedPreferences.getInstance();
    sp.remove("log_in_info");
    return "log_out_success";

  }

}
