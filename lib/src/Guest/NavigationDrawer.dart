import 'package:campus_guide/src/ChooseTeacherOrStudent.dart';
import 'package:campus_guide/src/Global/Nav_Club_Info.dart';
import 'package:campus_guide/src/Guest/Nav_Admission.dart';
import 'package:campus_guide/src/Guest/Nav_Advisor.dart';
import 'package:campus_guide/src/Global/Nav_Bus_Sedule.dart';
import 'package:campus_guide/src/Guest/Nav_Prospectus.dart';
import 'package:campus_guide/src/Global/Nav_Teacher.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {

  /*final key;

  NavigationDrawer({this.key});*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.transparent,
          body:Container(
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: <Widget>[header, list(context)],
            ),
          ),
          );
  }

  Widget header = new Container(
    width: double.infinity,
    height: 200,
    color: Colors.blue,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage("Img/man.png"))),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Guest",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );

  Widget list(BuildContext context) => Expanded(
    child: new ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[





            InkWell(
              onTap: (){

                Navigator.pop(context);

                Navigator.push(context, new MaterialPageRoute(builder: (context)=>TeacherOrStudent()));

              },

              child: ListTile(
                leading: new Image(
                  image: AssetImage("Img/log_in.png"),
                  color: Colors.green,
                  height: 25,
                  width: 25,
                ),
                title: Text(
                  "Log In",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),




            InkWell(
              onTap: (){


                Navigator.pop(context);




                Navigator.push(context, new MaterialPageRoute(builder: (context)=>Admission()));

              },

              child: ListTile(
                leading: new Image(
                  image: AssetImage("Img/admission.png"),
                  color: Colors.green,
                  height: 25,
                  width: 25,
                ),
                title: Text(
                  "Admission Overview",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            InkWell(

              onTap: (){


                Navigator.pop(context);


                Navigator.push(context, new MaterialPageRoute(builder: (context)=>Nav_Teacher()));

              },

              child: ListTile(
                leading: new Image(
                  image: AssetImage("Img/teacher.png"),
                  color: Colors.green,
                  height: 25,
                  width: 25,
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



                Navigator.push(context, new MaterialPageRoute(builder: (context)=>Prospectues()));

              },

              child: ListTile(
                leading: new Image(
                  image: AssetImage("Img/prospectus.png"),
                  color: Colors.green,
                  height: 25,
                  width: 25,
                ),
                title: Text(
                  "Prospectus",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            ListTile(
              leading: new Image(
                image: AssetImage("Img/facilty.png"),
                color: Colors.green,
                height: 25,
                width: 25,
              ),
              title: Text(
                "Facility",
                style: TextStyle(color: Colors.green),
              ),
            ),
            InkWell(

                onTap: (){

                  Navigator.pop(context);


                  Navigator.push(context, new MaterialPageRoute(builder: (context)=>Course_Advisor()));

                },
                child: ListTile(
                  leading: new Image(
                    image: AssetImage("Img/course_advisor.png"),
                    color: Colors.green,
                    height: 25,
                    width: 25,
                  ),
                  title: Text(
                    "Course Advisor",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),

            InkWell(

              onTap: (){

                Navigator.pop(context);


                Navigator.push(context, new MaterialPageRoute(builder: (context)=>BusSedule()));


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


                Navigator.push(context, new MaterialPageRoute(builder: (context)=>ClubInfo()));

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
                Icons.landscape,
                color: Colors.green,
              ),
              title: Text(
                "Scholarship Details",
                style: TextStyle(color: Colors.green),
              ),
            ),

            ListTile(
              leading: new Icon(
                Icons.landscape,
                color: Colors.green,
              ),
              title: Text(
                "Achivement Gallary",
                style: TextStyle(color: Colors.green),
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
          ],
        ),
  );
}
