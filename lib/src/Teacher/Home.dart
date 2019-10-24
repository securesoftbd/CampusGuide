import 'dart:io';

import 'package:campus_guide/src/Teacher/Model/TeacherInfo.dart';
import 'package:campus_guide/src/Teacher/NavigationDrawer.dart';
import 'package:campus_guide/src/Utils/Common.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'Model/Post.dart';




class Teacher_Home extends StatefulWidget {
  final number;

  Teacher_Home({this.number});

  @override
  _Teacher_HomeState createState() => _Teacher_HomeState();
}

class _Teacher_HomeState extends State<Teacher_Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

 // TeacherInfo teacherInfo;

  var data_status;

  final post_controller = new TextEditingController();

  var post_state;

  var focusNode = new FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("Number  of ${widget.number}");

    featch_data();



/*
    FocusScope.of(context).canRequestFocus(focusNode);
*/
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
          new TeacherInfo.fromFB(data);
       /* });*/
      }).catchError((e) {
        print("Error ${e}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (TeacherInfo.name != "") {
      print("Teacher Info  name : ${TeacherInfo.name}");
    }


    return  WillPopScope(

/*

      onWillPop: (){



       // if(widget.number!=null){
         // exit(0);


       // }


      },
*/

      child: MaterialApp(
                  color: Colors.white,
                  debugShowCheckedModeBanner: false,
                  home: Scaffold(
                    key: _scaffoldKey,
                    drawer: Drawer(child: NavigationDrawer( number: widget.number, )),
                    appBar: AppBar(
                      actions: <Widget>[
                        InkWell(
                          child: new Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          onTap: () {},
                        ),
                        InkWell(
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          onTap: () {},
                        ),
                      ],
                      title: Text(
                        "Home",
                        style: new TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.0,
                            fontSize: 20,
                            fontStyle: FontStyle.normal),
                      ),
                      leading: InkWell(
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onTap: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                      ),
                    ),
                    body: SingleChildScrollView(
                      child: new Column(
                              children: <Widget>[
                                top(),
                                SizedBox(
                                  height: 7,
                                ),
                                bottom()
                              ],
                            ),
                    ),

                    ),
                ),
    );


  }

  Widget top() {
    return new Container(
      child: Column(
        children: <Widget>[
          Card(
            elevation: 2,
            margin: EdgeInsets.all(15),
            child: Container(
                height: 130,
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: TextField(
                    autofocus: false,
                    autocorrect: false,
                    controller: post_controller,
                    maxLines: 5,
                    maxLength: 500,
                    style: TextStyle(color: Colors.green),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Write your post..",
                      hintStyle: TextStyle(color: Colors.greenAccent),
                    ),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: SizedBox(
              width: 100,
              child: RaisedButton(
                onPressed: () {
                  if (post_controller.text.isNotEmpty) {
                    FirebaseDatabase.instance
                        .reference()
                        .child(Common.ref_tacher)
                        .child(Common.ref_teacher_post)
                        .child(widget.number)
                        .push()
                        .set({
                      "date": new DateTime.now().toIso8601String(),
                      "Post": post_controller.text,
                      "name":TeacherInfo.name,
                      "designation":TeacherInfo.designation

                    }).then((_) {
                      setState(() {
                        post_state = "update";
                        post_controller.text = "";
                      });
                    }).catchError((e) {
                      print("Error ${e}");
                    });
                  }
                },
                child: Text("Post"),
                color: Colors.blueAccent,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                elevation: 1,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottom() {
    return StreamBuilder(
      stream: FirebaseDatabase.instance
          .reference()
          .child(Common.ref_tacher)
          .child("Post")
          .onValue,
      builder: (context, datasnapshort) {
        List<Post> post_list = new List();


           print(  "  hasData   ${datasnapshort.hasError} ");

          if (datasnapshort!= null &&
              datasnapshort.hasError==false) {
           // print("Value   ${datasnapshort.data.snapshot.value.runtimeType}");


            if(datasnapshort.data!=null) {
              Map<dynamic, dynamic> post_value = datasnapshort.data.snapshot
                  .value;


              if(post_value!=null){


                post_value.forEach((key, value) {
                  print(value.runtimeType);




                  Map<dynamic, dynamic> post = value;


                  if(post!=null){

                    print("Post  isss  $post ");


                    try{


                      post.forEach((key, value) {
                        print(value["Post"]);
                        print(value["date"]);


                        Post post = new Post(
                            post: value["Post"], date: value["date"],name: value["name"],designation: value["designation"]);
                        post_list.add(post);
                      });



                    }catch(e){

                      print(e);
                    }





                  }

                });

              }




            }

            if(post_list!=null  && TeacherInfo.name !=null ){
              return  ListView.builder(
                  physics: new NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: post_list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                     // height: 130,
                      child: Card(
                        margin: EdgeInsets.only(
                            left: 12, right: 12, top: 3, bottom: 3),
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  post_list[index].name.toString(),
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.green),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  TeacherInfo.designation,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                                SizedBox(
                                  height: 4,
                                ),


                                Text(post_list[index].post,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }else{
              
              return Center(
                
                child:Text("Post is not avilable") ,
                
              );

            }


            }else if(datasnapshort.hasError || datasnapshort==null){

            return Center(
              child: Container(),

            );

          }


      },
    );
  }

  Future<List<Post>> _getAllPost() async {
    List<Post> post_list = new List();

    FirebaseDatabase.instance
        .reference()
        .child(Common.ref_tacher)
        .child("Post")
        .child(widget.number.toString())
        .once()
        .then((post) {
      Post post_class = new Post();

      Map<dynamic, dynamic> data = post.value;

      data.forEach((key, value) {
        post_class.post = value["Post"];
        post_class.date = value["date"];
        post_class.name = value["name"];
        post_class.designation=value["designation"];


        post_list.add(post_class);
      });
    }).catchError((e) {
      print("Error  ${e}");
    });

    return post_list;
  }

  List<Post> break_post_future_data() {
    List<Post> post_list = new List();

    _getAllPost().then((data) {
      post_list = data;
    });

    return post_list;
  }


  _moreText(){

    print("You have clicked on  more text");

  }
}
