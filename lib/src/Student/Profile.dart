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
  @override
  Widget build(BuildContext context) {

   // int index=1;



    return  WillPopScope(
      onWillPop:(){

        print(" It's not calling .....");

        Navigator.pop(context);
      }

      ,
      child: MaterialApp(
          home: Scaffold(


            appBar: AppBar(


              leading: InkWell(
                  onTap: (){

                    Navigator.pop(context);

                  },
                child:Icon(Icons.arrow_back,color: Colors.white,),
              ),

              title: Text("Profile"),
            ),

            body:FutureBuilder(future:    FirebaseDatabase.instance.reference().child(Common.ref_student).child(widget.number).child(Common.ref_student_basic_info).once(),  builder: (context,snapshort){



              //  print(snapshort.data.value["Name"]);

              if(snapshort.data==null){

                return Center(
                  child: CircularProgressIndicator(),

                );
              }else{

               return Container(

                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,

                  alignment: Alignment.center,
                  child: Center(
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: <Widget>[



                        Container(

                          width: 125,
                          height: 125,

                          decoration: BoxDecoration(

                            shape: BoxShape.circle,

                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:NetworkImage(snapshort.data.value["Image"]) ),

                          ),
                        ),

                        Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: <Widget>[



                            SizedBox(height: 60,),

                            // Text("Name : "),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[


                                Text("Name :",style: TextStyle(color: Colors.green),),
                                Text("${snapshort.data.value["Name"]}")

                              ],),

                            SizedBox(height: 15,),

                            //   Text("Email : "),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[

                                Text("Email :",style: TextStyle(color: Colors.green),),

                                Text("${snapshort.data.value["Email"]}")

                              ],
                            ),



                            SizedBox(height: 15,),

                            // Text("Phone : "),


                            Row(

                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[


                                Text("Phone :",style: TextStyle(color: Colors.green), ),

                                Text("${snapshort.data.value["Phone Number"]}"),

                              ],
                            ),



                            SizedBox(height: 15,),

                            //  Text("Student ID : "),


                            Row(

                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                Text("Student ID :",style: TextStyle(color: Colors.green),),

                                Text("${snapshort.data.value["Student ID"]}"),



                              ],

                            ),

                            SizedBox(height: 15,),

                            //   Text("Depertment : "),


                            Row(

                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[

                                Text("Depertment :",style: TextStyle(color: Colors.green),),

                                Text("${snapshort.data.value["Depertment"]}"),



                              ],

                            ),


                            SizedBox(height: 10,),


                            Row(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[

                                Text("Campus :",style: TextStyle(color: Colors.green),),

                                Text("${  snapshort.data.value["Campus"]==0? "Permenant Campus" : snapshort.data.value["Campus"]==1 ? "Main Campus":"Uttora Campus"}"),

                              ],

                            ),



                            //  Text("Name : ${}"),



                            SizedBox(height: 10,),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[

                                Text("Gender :",style: TextStyle(color: Colors.green),),


                                Text("${snapshort.data.value["Gender"]==0? "Male" : "Female"}"),

                              ],

                            )


                            // SizedBox(height: 10,),



                          ],
                        )


                      ],

                    ),
                  ),
                );

              }


            }),
          ),
        ),
    );
  }
}
