import 'package:campus_guide/src/Teacher/Display_ConcelingHour.dart';
import 'package:campus_guide/src/Teacher/Edit_Profile.dart';
import 'package:campus_guide/src/Teacher/Home.dart';
import 'package:campus_guide/src/Teacher/Model/TeacherInfo.dart';
import 'package:campus_guide/src/Utils/Common.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {


  final number;


  Profile({this.number});

  @override
  _ProfileState createState() => _ProfileState();
}






class _ProfileState extends State<Profile> {



  var name;
  var depertment;
  var designation;
  var email;
  var phone_number;
  var gender;
  var campus;
  var room_number;
  var off_day;




//  TeacherInfo teacherInfo =new TeacherInfo();


   String _profile_image_url;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();




   // teacherInfo=new TeacherInfo();
  }



   void featch_data() {
     if (widget.number != null) {

       print("Phone number  ${widget.number}");

       FirebaseDatabase.instance
           .reference()
           .child(Common.ref_tacher)
           .child(widget.number)
           .child(Common.ref_teacher_profile)
           .once()
           .then((data) {
         /* setState(() {*/
       //  new TeacherInfo.fromFB(data);
         /* });*/


         setState(() {


           name=data.value["Name"];
           campus=data.value["Campus"];
           depertment=data.value["Depertment"];
           designation=data.value["Designation"];
           email=data.value["Email"];
           gender=data.value["Gender"];
           //=data.value["Image"];
           off_day=data.value["OffDay"];
           phone_number=data.value["Phone Number"];
           room_number=data.value["RoomNumber"];




         });

       }).catchError((e) {
         print("Error ${e}");
       });
     }
   }



  @override
  Widget build(BuildContext context) {

    featch_data();


   // print("Firebaseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee Database .................");


    getUserImage();

    print("Image....................................   ${TeacherInfo.user_image}");

    return  MaterialApp(
        home: Scaffold(


          appBar: AppBar(
            leading: InkWell(
                onTap: (){

                  Navigator.pop(context);

                },

                child: new Icon(Icons.arrow_back,color: Colors.white,)),


            title: Text("Profile"),

          ),

         // key: _key,
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 13,
                ),
                image(),
                edit_button(context),
                SizedBox(
                  height: 13,
                ),
                second_part(),
              ],
            ),
          ),
        ),
      );
  }

  Widget image (){


    return  Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          shape: BoxShape.circle,



          image: DecorationImage(
            fit: BoxFit.cover,
              image: new NetworkImage(

                  _profile_image_url!=null?_profile_image_url : "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjb-_G506jlAhXWfSsKHTWoDTUQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.iconfinder.com%2Ficons%2F3140747%2Favatar_boy_haircut_male_man_profile_icon&psig=AOvVaw2hnzqc8JQWMPiwFSV2QuWZ&ust=1571585792037204"


              ) )),
   /* ):Container(
      width: 150,
      height: 150,

      child: CircularProgressIndicator(),
    );*/

    );
  }

  Widget second_part (){

    return new Container(
      margin: EdgeInsets.only(left: 70),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Name :",
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                name!=null ? name :""  ,
                style: TextStyle(color: Colors.black, fontSize: 13),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: <Widget>[
              Text(
                "Depertment :",
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
              SizedBox(
                width: 2,
              ),
              Text(

                depertment!=null ? depertment :"",
                style: TextStyle(color: Colors.black, fontSize: 13),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: <Widget>[
              Text(
                "Designation :",
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                designation !=null ? designation:"",
                style: TextStyle(color: Colors.black, fontSize: 13),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: <Widget>[
              Text(
                "Email Id :",
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                email!=null ? email :"",
                style: TextStyle(color: Colors.black, fontSize: 13),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: <Widget>[
              Text(
                "Phone Number :",
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                phone_number!=null ? phone_number:"",
                style: TextStyle(color: Colors.black, fontSize: 13),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: <Widget>[
              Text(
                "Gender :",
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                gender==0?"Male" : "Female",
                style: TextStyle(color: Colors.black, fontSize: 13),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: <Widget>[
              Text(
                "Campus :",
                style: TextStyle(color: Colors.green, fontSize: 22),
              ),
              Text(
                "${ get_campus(campus)}",
                style: TextStyle(color: Colors.black, fontSize: 17),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: <Widget>[
              Text(
                "Room Number :  ${room_number!=null?room_number:""}",
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),

            ],
          ),
          SizedBox(
            height: 12,
          ),
          /* Row(
          children: <Widget>[
            Text(
              "Conciling Hour :",
              style: TextStyle(color: Colors.green, fontSize: 18),
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              "Osttirurzaman Thuhin",
              style: TextStyle(color: Colors.black, fontSize: 13),
            )
          ],
        ),*/
          SizedBox(
            height: 12,
          ),
          Row(
            children: <Widget>[
              Text(
                "Off day :",
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                off_day!=null ? off_day:"",
                style: TextStyle(color: Colors.black, fontSize: 13),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),


          Row(

            crossAxisAlignment: CrossAxisAlignment.center,
           // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

            Text("Conceling Hour :"),
            SizedBox(width: 10,),

            _counceling_hour()

          ],),
        ],
      ),
    );


  }



  Widget _counceling_hour(){

    return  InkWell(


      onTap: (){

       /// Navigator.pop(context);
        ///

        Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>Display_Councling_hour()));



      },
      child: Container(

        width: 120,
        height: 30,



        decoration: BoxDecoration(
          color: Colors.white,

          boxShadow:[

            BoxShadow(

              color: Colors.black12,
              blurRadius: 6

            )

          ]

        ),

        child: Center(child: Text("Show",textAlign: TextAlign.center,)),

      ),
    ) ;

  }


  Widget edit_button(BuildContext context) => new Container(
    alignment: Alignment.topRight,
    
    child: SizedBox(
      width: 60,
      height: 20,
      child: new RaisedButton(
        color: Colors.white,
        onPressed: () {


        //  Navigator.pop(context);

          Navigator.push(context,MaterialPageRoute(builder: (context)=>Edit_profile(number: widget.number,)));

        },
        child: Padding(
          padding: const EdgeInsets.only(right:3.0),
          child: Text("Edit",style: TextStyle(fontSize: 12),),
        ),
      ),
    ),
    
  );
  
  
  
  
 static String get_campus(int campus){
    String cm;
    
    if(campus==0){
      
      cm="Main Campus";
      
    }else if(campus==1){
      cm="Permenant Campus";
    }else{
      cm="Uttora Campus";
    }
    
    return cm;
    
    
  }



  getUserImage() async {



    await  FirebaseDatabase.instance.reference().child("Teacher")
        .child(widget.number)
        .child(Common.ref_teacher_profile).child("Image").once().then((pp){


      print("Callingggggggggggg....");


      if(pp.value!=null){

        print("PP ${pp.value}");

       setState(() {


          _profile_image_url=pp.value;

       });
      }else{

        print("Profile is not created");

      }




    }).catchError((e){

      print("Error  $e");

    });

  }
  






/*new RaisedButton(
    onPressed: () {},
    child: Text("Edit"),
  );*/
}
