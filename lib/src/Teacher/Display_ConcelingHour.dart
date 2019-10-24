import 'dart:collection';

import 'package:campus_guide/src/Teacher/Model/TeacherInfo.dart';
import 'package:campus_guide/src/Utils/Common.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Display_Councling_hour extends StatefulWidget {
  @override
  _Display_Councling_hourState createState() => _Display_Councling_hourState();
}

class _Display_Councling_hourState extends State<Display_Councling_hour> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   // featch_counceling_hour();
  }

  @override
  Widget build(BuildContext context) {
    print(
        " Valueeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee Number  ${TeacherInfo.phone_number}");

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: new Text("Councilling Hour"),
          leading: InkWell(
            child: InkWell(

                onTap: (){

                  Navigator.pop(context);

                },

                child: Icon(Icons.arrow_back)),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseDatabase.instance
              .reference()
              .child(Common.ref_tacher)
              .child(TeacherInfo.phone_number)
              .child(Common.ref_teacher_councilling_hour)
              .onValue,
          builder: (context, datasnaption) {

            print("Valueeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee   ${datasnaption.data.snapshot.value}");


            Map<dynamic,dynamic> _concelling_hour=datasnaption.data.snapshot.value;






            _concelling_hour.forEach((key,value){

              print("Valueeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee days ${key}");

              print("Valueeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee  value ${value}");


            });




            if(datasnaption.hasData){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[

                    Container(

                      height: 30,
                      decoration: BoxDecoration(

                        border: Border.all(color: Colors.green)
                      ),
                      child: Row(
                        children: <Widget>[

                          SizedBox(width: 50,),
                          Expanded(child: new  Text("Day")),
                          new   Text("Time"),

                          SizedBox(width: 50,),


                        ],

                      ),
                    ),


                    Expanded(
                      child: ListView.builder(

                        itemCount: _concelling_hour.keys.toList().length,

                        itemBuilder: (BuildContext context,int item){

                          return Container(

                            decoration: BoxDecoration(

                                border: Border.all(color: Colors.green,width: 1)

                            ),


                            child: Row(

                              children: <Widget>[

                                Expanded(
                                  flex: 1,
                                  child: Container(


                                      child: Padding(
                                        padding: const EdgeInsets.only(left:10.0),
                                        child: Text("${_concelling_hour.keys.toList()[item]}"),
                                      )),
                                ),




                                Spacer(),
                                //  Text("Value ${_concelling_hour.values.toList()[item].toList()[0]}"),






                                Expanded(
                                  flex: 2,
                                  child: Container(

                                    decoration: BoxDecoration(

                                      border: Border(
                                          left: BorderSide(
                                              color: Colors.green,
                                              width: 1

                                          )
                                      ),


                                    ),
                                    child: Column(

                                        children: _concelling_hour.values.toList()[item].map<Widget>((v){

                                          return Container(

                                            // height: 55,
                                            child:Column(children: <Widget>[

                                              new  Text(v),


                                              Divider(color:Colors.green,),


                                            ],),

                                          );

                                        }).toList()

                                    ),
                                  ),
                                )


                              ],

                            ),

                          );

                        },


                      ),
                    ),

                  ],
                ),
              );

            }else{

              return Center(
                child: CircularProgressIndicator(),

              );
            }

          },
        ),
      ),
    );
  }

/*
  Future<DataSnapshot> featch_counceling_hour() async {

   // DataSnapshot dataSnapshot;


    FirebaseDatabase.instance.reference().child(Common.ref_tacher).child(TeacherInfo.phone_number).child(Common.ref_teacher_councilling_hour).once().then((value){

      print("Valueeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee ${value.value}");


    }).catchError((error){


      print("Error");

    });



    
  }
*/
}
