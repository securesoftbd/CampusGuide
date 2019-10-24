import 'dart:io';

import 'package:campus_guide/src/Teacher/Edit_Profile.dart';
import 'package:campus_guide/src/Teacher/Model/TeacherInfo.dart';
import 'package:campus_guide/src/Utils/Common.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_container/overlay_container.dart';
import 'package:swipedetector/swipedetector.dart';

class Add_Councilling_Hour extends StatefulWidget {
  final ch;

  final initial_state;

  final number;

  Add_Councilling_Hour({this.ch,this.initial_state,this.number});
  @override
  _Add_Councilling_HourState createState() => _Add_Councilling_HourState();
}

class _Add_Councilling_HourState extends State<Add_Councilling_Hour> {
  Map<String, List<String>> councle_hour_list = new Map();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.ch!=null){
      setState(() {
        councle_hour_list=widget.ch;
      });
    }
    print("Monu  build   initState");


    if(widget.initial_state=="ok"){



      getCouncilling_four_data_from_firebase().then((data){


        if(data!=null){

          setState(() {


            councle_hour_list=data;

          });
        }

      });



    }



  }







  Future<Map<String,List<String>>> getCouncilling_four_data_from_firebase() async {



    Map<String,List<String>> coucilling_hour_list=new Map();

   await FirebaseDatabase.instance.reference().child(Common.ref_tacher).child(widget.number).child(Common.ref_teacher_councilling_hour).once().then((snap){

      print("   snap.value   ${snap.value}");

      Map <dynamic,dynamic> map =snap.value;

      List<String> time=new List();

      map.forEach((key,value){

        print("key  ${key}");
        print("value  ${value}");

        List<dynamic> time_list=value;

        time_list.forEach((v){
          print("Time   ${v}");
          time.add(v.toString());

        });


        print("Time list  ${time}");

        coucilling_hour_list.putIfAbsent(key, ()=>time.toList());
        time.clear();

      });

    }).catchError((e){


      print("Error  ${e}");
    });



    return coucilling_hour_list;

  }





  var isClcked = false;

  var _selected_day = "Day";
  int _to = 0;
  int _form = 0;
  var day_list = [
    "Saturday",
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday"
  ];
  var time_list = [
    "08:00 am",
    "08:15 am",
    "08:35 am",
    "08:45 am",
    "09:00 am",
    "09:15 am",
    "09:35 am",
    "09:45 am",
    "10:00 am",
    "10:15 am",
    "10:35 am",
    "10:45 am",
    "11:00 am",
    "11:15 am",
    "11:35 am",
    "11:45 am",
    "12:00 pm",
    "12:15 pm",
    "12:35 pm",
    "12:45 pm",
    "01:00 pm",
    "01:15 pm",
    "01:35 pm",
    "01:45 pm",
    "02:00 pm",
    "02:15 pm",
    "02:35 pm",
    "02:45 pm",
    "03:00 pm",
    "03:15 pm",
    "03:35 pm",
    "03:45 pm",
    "04:00 pm",
    "04:15 pm",
    "04:35 pm",
    "04:45 pm",
    "05:00 pm",
    "05:15 pm",
    "05:35 pm",
    "05:45 pm",
    "06:00 pm",
    "06:15 pm",
    "06:35 pm",
    "06:45 pm",
    "07:00 pm",
    "07:15 pm",
    "07:35 pm",
    "07:45 pm",
    "08:00 pm",
    "08:15 pm",
    "08:35 pm",
    "08:45 pm",
  ];

  bool _show_time_and_date_piker = true;

  void _open_date_and_time_piker() {
    setState(() {
      _show_time_and_date_piker = !_show_time_and_date_piker;
    });
  }

  DragStartDetails to_startVerticalDragDetails;
  DragUpdateDetails to_updateVerticalDragDetails;

  DragStartDetails from_startVerticalDragDetails;
  DragUpdateDetails from_updateVerticalDragDetails;

  var _current_depertment = "";
  var ok;


  @override
  Widget build(BuildContext context) {
    print("Monu  build");


    if(ok=="ok"){

      print("I am ok boss");
    }
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,


      routes: {
        "/edit_profile": (context)=>Edit_profile(number: widget.number,),

      },

      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(
            "Councilling Hour",
            style: TextStyle(color: Colors.white),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
              )),
          actions: <Widget>[
            new Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            new Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            _list(),
            Positioned(
              top: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  top(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50.0, right: 50, top: 15),
                  ),
                ],
              ),
            ),
            save_button(),
          ],
        ),
      ),
    );
  }

  Widget top() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(6)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                child: Container(
                  width: ScreenUtil.getInstance().setWidth(140),
                  height:
                      ScreenUtil.getInstance().setHeight(isClcked ? 280 : 50),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (isClcked) {
                                  isClcked = false;
                                } else {
                                  isClcked = true;
                                }
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: Text(
                                  _selected_day,
                                  style: TextStyle(color: Colors.blue),
                                )),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.blueAccent,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: isClcked
                              ? ListView.builder(
                                  itemCount: day_list.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          _selected_day = day_list[index];

                                          isClcked = false;
                                        });
                                      },
                                      child: new Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: new Container(
                                            child: Text(
                                              day_list[index],
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                child: InkWell(
                  onTap: () {
                    show_dialog();
                  },
                  child: Container(
                    width: ScreenUtil.getInstance().setWidth(140),
                    height: ScreenUtil.getInstance().setHeight(50),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            "Time",
                            style: TextStyle(color: Colors.blueAccent),
                          )),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10.0, right: 10.0),
                            child: Icon(
                              Icons.access_alarm,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
           /* Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Container(
                width: ScreenUtil.getInstance().setWidth(50),
                height: ScreenUtil.getInstance().setHeight(50),
                decoration:
                    BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }

  Widget save_button() {
    return Positioned(
      bottom: ScreenUtil.getInstance().setHeight(15),
      right: ScreenUtil.getInstance().setWidth(150),
      left: ScreenUtil.getInstance().setWidth(150),
      child: Container(
        child: RaisedButton(
          onPressed: () {



              print("Numberrrrr    ${TeacherInfo.phone_number}");


              FirebaseDatabase.instance.reference().child(Common.ref_tacher).child(widget.number).child(Common.ref_teacher_councilling_hour).set(councle_hour_list).then((_){

              print("Data send");


              Navigator.pop(context,true);



             // Navigator.popUntil(context, ModalRoute.withName('/edit_profile'));


           /*   Route route = MaterialPageRoute(builder: (context) => Edit_profile(number: widget.number,));
              Navigator.pushReplacement(context, route);
*/

            }).catchError((e){

              print("Error   ${e}");

            });


          },
          color: Colors.green,
          textColor: Colors.white,
          child: Text("Save"),
        ),
      ),
    );
  }

  void show_dialog(  )  {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {




          String to_first_time = "${time_list[0]}";
          String to_second_time = "${time_list[1]}";
          String to_third_time = "${time_list[2]}";

          String from_first_time = "${time_list[0]}";
          String from_second_time = "${time_list[1]}";
          String from_third_time = "${time_list[2]}";

          String _dilog_type = "";

          return Dialog(
              elevation: 0.5,
              insetAnimationDuration: Duration(milliseconds: 1000),
              insetAnimationCurve: Curves.easeInBack,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: Colors.white,
              child: StatefulBuilder(
                builder: (context, setState) {
                  return _dilog_type != "alert"
                      ? Container(
                          color: Colors.transparent,
                          width: 300,
                          height: 200,
                          child: Stack(
                            children: <Widget>[
                              top_dialog(),
                              Positioned(
                                top: 40,
                                bottom: 40,
                                child: SizedBox(
                                  width: 300,
                                  height: double.infinity,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: GestureDetector(
                                          onVerticalDragStart: (dragDetails) {
                                            from_startVerticalDragDetails =
                                                dragDetails;
                                          },
                                          onVerticalDragUpdate: (dragDetails) {
                                            from_updateVerticalDragDetails =
                                                dragDetails;
                                          },
                                          onVerticalDragEnd: (endDetails) {
                                            double dx =
                                                from_updateVerticalDragDetails
                                                        .globalPosition.dx -
                                                    from_startVerticalDragDetails
                                                        .globalPosition.dx;

                                            double dy =
                                                from_updateVerticalDragDetails
                                                        .globalPosition.dy -
                                                    from_startVerticalDragDetails
                                                        .globalPosition.dy;

                                            double velocity =
                                                endDetails.primaryVelocity;

                                            if (dy < 0) {
                                              setState(() {
                                                _form += 1;

                                                if (_form == time_list.length) {
                                                  _form = 0;
                                                }

                                                if (_form == 0) {
                                                  from_first_time = time_list[
                                                      time_list.length];
                                                  from_second_time =
                                                      time_list[0];
                                                  from_third_time =
                                                      time_list[1];
                                                } else if (_form ==
                                                    time_list.length) {
                                                  from_first_time = time_list[
                                                      time_list.length - 1];
                                                  from_second_time = time_list[
                                                      time_list.length];
                                                  from_third_time =
                                                      time_list[0];
                                                } else {
                                                  from_first_time =
                                                      time_list[_form - 1];
                                                  from_second_time =
                                                      time_list[_form];
                                                  from_third_time =
                                                      time_list[_form + 1];
                                                }
                                              });
                                            } else {
                                              // print("Swipe down");

                                              setState(() {
                                                _form -= 1;

                                                if (_form == time_list.length) {
                                                  _form = 0;
                                                }

                                                if (_form == 0) {
                                                  from_first_time = time_list[
                                                      time_list.length];
                                                  from_second_time =
                                                      time_list[0];
                                                  from_third_time =
                                                      time_list[1];
                                                } else if (_form ==
                                                    time_list.length) {
                                                  from_first_time = time_list[
                                                      time_list.length - 1];
                                                  from_second_time = time_list[
                                                      time_list.length];
                                                  from_third_time =
                                                      time_list[0];
                                                } else {
                                                  from_first_time =
                                                      time_list[_form - 1];
                                                  from_second_time =
                                                      time_list[_form];
                                                  from_third_time =
                                                      time_list[_form + 1];
                                                }
                                              });
                                            }
                                          },
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  "${from_first_time}",
                                                  style: TextStyle(
                                                      color: Colors.black12,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0),
                                                  child: Text(
                                                    "${from_second_time}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "${from_third_time}",
                                                  style: TextStyle(
                                                      color: Colors.black12,
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onVerticalDragStart: (dragDetails) {
                                            to_startVerticalDragDetails =
                                                dragDetails;

                                            /*  print(
                                                "startVerticalDragDetails   ${to_startVerticalDragDetails}");*/
                                          },
                                          onVerticalDragUpdate: (dragDetails) {
                                            to_updateVerticalDragDetails =
                                                dragDetails;

                                            /*print(
                                                " updateVerticalDragDetails   ${to_updateVerticalDragDetails} ");*/
                                          },
                                          onVerticalDragEnd: (endDetails) {
                                            double dx =
                                                to_updateVerticalDragDetails
                                                        .globalPosition.dx -
                                                    to_startVerticalDragDetails
                                                        .globalPosition.dx;

                                            //   print("dx     ${dx}");

                                            double dy =
                                                to_updateVerticalDragDetails
                                                        .globalPosition.dy -
                                                    to_startVerticalDragDetails
                                                        .globalPosition.dy;

                                            //  print("dy     ${dy}");

                                            double velocity =
                                                endDetails.primaryVelocity;

                                            // print("velocity     ${velocity}");

                                            if (dy < 0) {
                                              // print("Swipe up to");

                                              setState(() {
                                                _to += 1;

                                                if (_to == time_list.length) {
                                                  _to = 0;
                                                }

                                                if (_to == 0) {
                                                  to_first_time = time_list[
                                                      time_list.length];
                                                  to_second_time = time_list[0];
                                                  to_third_time = time_list[1];
                                                } else if (_to ==
                                                    time_list.length) {
                                                  to_first_time = time_list[
                                                      time_list.length - 1];
                                                  to_second_time = time_list[
                                                      time_list.length];
                                                  to_third_time = time_list[0];
                                                } else {
                                                  to_first_time =
                                                      time_list[_to - 1];
                                                  to_second_time =
                                                      time_list[_to];
                                                  to_third_time =
                                                      time_list[_to + 1];
                                                }
                                              });
                                            } else {
                                              //  print("Swipe down  to");

                                              setState(() {
                                                _to -= 1;

                                                if (_to == time_list.length) {
                                                  _to = 0;
                                                }

                                                if (_to == 0) {
                                                  to_first_time = time_list[
                                                      time_list.length];
                                                  to_second_time = time_list[0];
                                                  to_third_time = time_list[1];
                                                } else if (_to ==
                                                    time_list.length) {
                                                  to_first_time = time_list[
                                                      time_list.length - 1];
                                                  to_second_time = time_list[
                                                      time_list.length];
                                                  to_third_time = time_list[0];
                                                } else {
                                                  to_first_time =
                                                      time_list[_to - 1];
                                                  to_second_time =
                                                      time_list[_to];
                                                  to_third_time =
                                                      time_list[_to + 1];
                                                }
                                              });

                                              /* print("_first_time  ${_first_time}");
                                    print("_second_time  ${_second_time}");
                                    print("_third_time  ${_third_time}");*/

                                            }
                                          },
                                          child: Container(
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "${to_first_time}",
                                                      style: TextStyle(
                                                          color: Colors.black12,
                                                          fontSize: 15),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15.0),
                                                      child: Text(
                                                        "${to_second_time}",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 17),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "${to_third_time}",
                                                      style: TextStyle(
                                                          color: Colors.black12,
                                                          fontSize: 15),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              /*bottom_dilog(from_second_time,to_second_time),*/

                              Positioned(
                                bottom: 0.0,
                                child: InkWell(
                                  onTap: () {
                                    String from_time = from_second_time
                                        .replaceAll(new RegExp(r'[:ampm]'), "");
                                    String to_time = to_second_time.replaceAll(
                                        new RegExp(r'[:ampm]'), "");

                                    String from_sub_string =
                                        from_second_time.substring(5);
                                    String to_sub_string =
                                        to_second_time.substring(5);

                                    if (from_time == to_time) {
                                      if (from_sub_string == "am" &&
                                          to_sub_string == "pm") {
                                        //perfect

                                        if (councle_hour_list
                                            .containsKey(_selected_day)) {
                                          //     print(_selected_day);

                                          setState(() {
                                            this.councle_hour_list[_selected_day].add(
                                                "${from_second_time}  to  ${to_second_time}");
                                          });
                                        } else {
                                          List<String> ls = new List<String>();

                                          ls.add(
                                              "${from_second_time}  to  ${to_second_time}  ");

                                          setState(() {
                                            this.councle_hour_list.putIfAbsent(
                                                _selected_day, () => ls);
                                          });
                                        }

                                        print("List   ${councle_hour_list}");



                                        setState(() {
                                          ok="ok";
                                        });



                                        Navigator.pop(context);




                                        Navigator.push(context, new MaterialPageRoute(builder: (context)=>Add_Councilling_Hour(ch:councle_hour_list,number: widget.number,)));
                                      } else {
                                        setState(() {
                                          _dilog_type = "alert";
                                        });

                                        //   print("Aleart");
                                      }
                                    } else if (int.parse(from_time) <
                                        int.parse(to_time)) {
                                      if (from_sub_string != "pm" &&
                                          to_sub_string != "am") {
                                        if (councle_hour_list
                                            .containsKey(_selected_day)) {
                                          //     print(_selected_day);

                                          setState(() {
                                            this.councle_hour_list[_selected_day].add(
                                                "${from_second_time}  to  ${to_second_time}");
                                          });
                                        } else {
                                          List<String> ls = new List<String>();

                                          ls.add(
                                              "${from_second_time}  to  ${to_second_time}  ");

                                          setState(() {
                                            this.councle_hour_list.putIfAbsent(
                                                _selected_day, () => ls);
                                          });
                                        }

                                        print("List   ${councle_hour_list}");

                                        setState(() {
                                          ok="ok";
                                        });

                                        Navigator.pop(context);
                                        Navigator.push(context, new MaterialPageRoute(builder: (context)=>Add_Councilling_Hour(ch:councle_hour_list,number: widget.number,)));
                                      } else {
                                        setState(() {
                                          _dilog_type = "alert";
                                        });

                                        print("Aleart");
                                      }
                                    } else if (from_sub_string.endsWith("am") &&
                                        to_sub_string.endsWith("pm")) {
                                      if (councle_hour_list
                                          .containsKey(_selected_day)) {
                                        //     print(_selected_day);

                                        setState(() {
                                          this.councle_hour_list[_selected_day].add(
                                              "${from_second_time}  to  ${to_second_time}");
                                        });
                                      } else {
                                        List<String> ls = new List<String>();

                                        ls.add(
                                            "${from_second_time}  to  ${to_second_time}  ");

                                        setState(() {

                                          this.councle_hour_list.putIfAbsent(
                                              _selected_day, () => ls);

                                        });
                                      }

                                      print("List   ${councle_hour_list}");

                                      setState(() {
                                        ok="ok";
                                      });

                                      Navigator.pop(context);

                                      //Navigator.of(context).push(new MaterialPageRoute(builder: null))
                                      Navigator.push(context, new MaterialPageRoute(builder: (context)=>Add_Councilling_Hour(ch:councle_hour_list,number: widget.number,)));
                                    } else {
                                      setState(() {
                                        _dilog_type = "alert";
                                      });

                                      print("Aleart");
                                    }
                                  },
                                  child: new Container(
                                    width: 300,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "Save",
                                      textAlign: TextAlign.center,
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          color: Colors.transparent,
                          width: 300,
                          height: 200,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                  right: 10,
                                  top: 10,
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _dilog_type = "not alert";
                                        });
                                      },
                                      child: new Icon(
                                        Icons.clear,
                                        color: Colors.blue,
                                      ))),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Time formate is not correct !!!",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        );
                  ;
                },
              ));
        });
  }

  Widget top_dialog() {
    return Positioned(
        top: 10,
        child: Container(
          child: SizedBox(
            width: 300,
            height: 40,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "From",
                        style: TextStyle(fontSize: 18, color: Colors.green),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Text(
                          "To",
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  height: 1,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ));
  }

  Widget _list() {
    return Positioned(
      top: 80,

      left: 20,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(

            //  shrinkWrap: true,
            //  scrollDirection: Axis.vertical,
            itemCount: councle_hour_list.length,
            itemBuilder: (BuildContext context, int index) {
              String key = councle_hour_list.keys.elementAt(index);

              return Column(
                children: <Widget>[


                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(child: Container(

                        width: 80,
                        height: 50,

                        decoration: BoxDecoration(



                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.5,
                            ),]

                        ),

                        child:Center(child: new Text("${key}",textAlign: TextAlign.center,)),


                      )

                      ),


                      SizedBox(width: 10,),


                      Expanded(
                        flex: 2,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: councle_hour_list[key].length,
                            itemBuilder: (BuildContext context, int index) {
                              return  Column(
                                children: <Widget>[

                                  Row(

                                    children: <Widget>[

                                      Container(

                                        width: 180,
                                        height: 50,


                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            boxShadow: [BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 0.5,
                                            ),]

                                        ),
                                        child: Center(child: Text(councle_hour_list[key][index])),


                                      ),

                                      SizedBox(width: 7,),

                                     InkWell(

                                       onTap: (){


                                         if(councle_hour_list[key].length==1){



                                           setState(() {
                                             councle_hour_list.remove(key);
                                           });


                                         }else{

                                           setState(() {
                                             councle_hour_list[key].removeAt(index);
                                           });

                                         }

                                       },
                                       child: new Container(

                                            width: 25,
                                            height: 25,

                                            decoration: BoxDecoration(

                                              color: Colors.amberAccent,
                                              shape: BoxShape.circle

                                            ),
                                            child: Center(child: Icon(Icons.clear,color: Colors.red,), widthFactor: 14,)),
                                     ),


                                    ],

                                  ),

                                  SizedBox(height: 5,),

                                ],
                              );
                            }),
                      ),

                    ],
                  ),

                  SizedBox(height: 10,),


                ],


              );
            }),
      ),
    );
  }
}
