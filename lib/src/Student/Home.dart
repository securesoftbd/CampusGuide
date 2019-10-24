import 'dart:io';

import 'package:campus_guide/src/Student/StudentDrawer.dart';
import 'package:campus_guide/src/Teacher/Model/Post.dart';
import 'package:campus_guide/src/Utils/Common.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Student_Home extends StatefulWidget {
  final number;

  Student_Home({this.number});

  @override
  _Student_HomeState createState() => _Student_HomeState();
}

class _Student_HomeState extends State<Student_Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    print("initState  called");
  }

  @override
  Widget build(BuildContext context)
  {


    print("Build method   is  runing  on...............................");

    return   MaterialApp(
          home: Scaffold(
            drawer: StudentDrawer(
                number: widget.number,
              ),

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
                  onTap: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
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
            ),
            body: SingleChildScrollView(
              child: new Column(
                children: <Widget>[
                  //top(),
                  /*SizedBox(
                    height: 7,
                  ),*/
                  bottom()
                ],
              ),
            ),
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

        print("  hasData   ${datasnapshort.hasError} ");

        if (datasnapshort != null && datasnapshort.hasError == false) {
          // print("Value   ${datasnapshort.data.snapshot.value.runtimeType}");

          if (datasnapshort.data != null) {
            Map<dynamic, dynamic> post_value =
                datasnapshort.data.snapshot.value;

            if (post_value != null) {
              post_value.forEach((key, value) {
                print(value.runtimeType);

                Map<dynamic, dynamic> post = value;

                if (post != null) {
                  print("Post  isss  $post ");

                  try {
                    post.forEach((key, value) {
                      print(value["Post"]);
                      print(value["date"]);

                      Post post = new Post(
                          post: value["Post"],
                          date: value["date"],
                          name: value["name"],
                          designation: value["designation"]);
                      post_list.add(post);
                    });
                  } catch (e) {
                    print(e);
                  }
                }
              });
            }
          }

          if (post_list != null) {
            return ListView.builder(
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
                                post_list[index].designation.toString(),
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                post_list[index].post,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: Text("Post is not avilable"),
            );
          }
        } else if (datasnapshort.hasError || datasnapshort == null) {
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
        post_class.designation = value["designation"];

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
}
