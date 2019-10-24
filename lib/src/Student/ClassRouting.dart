import 'package:flutter/material.dart';

class ClassRouting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List _days = ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday"];

    List _calss_saturday = [
      "10:10 am - 11.30 am",
      "1:10 pm - 2.30 pm",
      "3:00 pm - 5 pm"
    ];
    List _calss_sunday = ["1:10 pm - 2.30 pm", "3:00 pm - 5 pm"];
    List _calss_monday = ["3:00 pm - 5 pm"];
    List _calss_tuesday = ["11:00 pm - 2 pm"];
    List _calss_wednesday = ["8:30 pm - 10.00 pm", "11.30 am - 12:00 pm"];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text("Class Routing"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: <Widget>[
              Container(

                decoration: BoxDecoration(

                  border: Border.all(color:Colors.green,width: 1)

                ),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Day"),
                      new Text("Time"),
                      new Text("Room")
                    ],
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1)),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _days.length,
                      itemBuilder: (BuildContext context, int i) {
                        return Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.green, width: 1)),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 8,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Container(
                                    child: Text(_days[i]),
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 0,
                                  child: Container(
                                    width: 1,
                                    height: 100,
                                    color: Colors.green,
                                  )),
                              Expanded(
                                flex: 15,
                                child: new Container(
                                  child: Column(
                                    children: _calss_saturday.map((v) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(v),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          !v
                                                  .toString()
                                                  .endsWith("3:00 pm - 5 pm")
                                              ? Container(
                                                  width: double.infinity,
                                                  height: 1,
                                                  color: Colors.green,
                                                )
                                              : Container()
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 0,
                                  child: Container(
                                    width: 1,
                                    height: 100,
                                    color: Colors.green,
                                  )),
                              Expanded(
                                flex: 8,
                                child: new Container(
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text("AB3 201"),
                                    ),
                                    // SizedBox(height: 8,),

                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: Colors.green,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text("AB3 203"),
                                    ),

                                    SizedBox(
                                      height: 6,
                                    ),

                                    // Container(width: double.infinity,height: 1,color: Colors.green,),
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: Colors.green,
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text("AB3 204"),
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
