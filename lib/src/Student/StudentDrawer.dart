import 'package:campus_guide/src/ChooseTeacherOrStudent.dart';
import 'package:campus_guide/src/Global/Nav_Bus_Sedule.dart';
import 'package:campus_guide/src/Global/Nav_Club_Info.dart';
import 'package:campus_guide/src/Global/Nav_Teacher.dart';
import 'package:campus_guide/src/Guest/Nav_Advisor.dart';
import 'package:campus_guide/src/Student/ClassRouting.dart';
import 'package:campus_guide/src/Student/Profile.dart';
import 'package:campus_guide/src/Utils/Common.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StudentDrawer extends StatefulWidget {

  final number;


  StudentDrawer({this.number,Key key}):super(key:key);

  @override
  _StudentDrawerState createState() => _StudentDrawerState();
}

class _StudentDrawerState extends State<StudentDrawer> {
  var image;
  void featch_data() {


      print("Phone number  ${widget.number}");

      FirebaseDatabase.instance
          .reference()
          .child(Common.ref_student)
          .child(widget.number)
          .child(Common.ref_student_basic_info)
          .once()
          .then((data) {


        if(mounted){




          setState(() {

            image=data.value["Image"];

          });


        }



      }).catchError((e) {
        print("Error ${e}");
      });

  }





  @override
  Widget build(BuildContext context) {


    featch_data();


    return Drawer(
      child: Column(
        children: <Widget>[ header(), Expanded(child: list(context))],
      ),
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
            height: 10,
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
                      image: image!=null ? NetworkImage (


                          image

                      ): NetworkImage (


                          "https://cdn3.iconfinder.com/data/icons/education-2-2/256/Student_Reading-512.png"

                      ))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Student",
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



      ListTile(
          onTap: (){

            Navigator.pop(context);

            Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>Profile(number:widget.number)));
          },
          leading: new Icon(
            Icons.perm_identity,
            color: Colors.green,
          ),
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.green),
          ),
        ),

      ListTile(

        onTap: (){

          Navigator.pop(context);

          Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>ClassRouting()));

        },
        leading:Image.asset("Img/class_routing.png"),
        title: Text(
          "Class Routine",
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


          Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>Course_Advisor()));


        },

        child: ListTile(
          leading: Image.asset("Img/advisor.png"),
          title: Text(
            "Course Advisor",
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
            Icons.home,
            color: Colors.green,
          ),
          title: Text(
            "Club Information",
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
          leading:new Image.asset("Img/project_thetis.png"),
          title: Text(
            "Project / Thesis",
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
          leading:new Image.asset("Img/question_bank.png"),
          title: Text(
            "Question Bank",
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
            Icons.notifications_active,
            color: Colors.green,
          ),
          title: Text(
            "Notice Bord",
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
              //log_out_state=true;
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
    sp.remove("log_in_info_as_student");
    return "log_out_success";

  }
}
