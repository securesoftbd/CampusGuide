import 'package:flutter/material.dart';
class BusSedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        
        appBar: AppBar(

          leading: InkWell(

              onTap: (){

                Navigator.pop(context);

              },
              child: new Icon(Icons.arrow_back)),
          title: Text("Bus Sedule"),
          
        ),

        body: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Text("From Permanent Campus",style: TextStyle(fontSize: 20,color: Colors.blue),),


                        SizedBox(height: 7,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("Bus Name",style: TextStyle(fontSize: 17,color: Colors.blue),),

                            Text("Bus Number",style: TextStyle(fontSize: 17,color: Colors.blue),),
                            Text("Start Time",style: TextStyle(fontSize: 17,color: Colors.blue),)


                          ],
                        ),

                        Divider(height: 5,color: Colors.blue,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("SurjoMuki",style: TextStyle(color: Colors.black54,fontSize: 17),),

                            Text("31",style: TextStyle(color: Colors.black54,fontSize: 17),),
                            Text("5.15pm",style: TextStyle(color: Colors.black54,fontSize: 17),)


                          ],
                        ),

                        Divider(height: 1,color: Colors.black54,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("SurjoMuki",style: TextStyle(color: Colors.black54,fontSize: 17),),

                            Text("32",style: TextStyle(color: Colors.black54,fontSize: 17),),
                            Text("6.15pm",style: TextStyle(color: Colors.black54,fontSize: 17),)


                          ],
                        ),

                        Divider(height: 1,color: Colors.black54,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("SurjoMuki",style: TextStyle(color: Colors.black54,fontSize: 17),),

                            Text("33",style: TextStyle(color: Colors.black54,fontSize: 17),),
                            Text("7.15pm",style: TextStyle(color: Colors.black54,fontSize: 17),)


                          ],
                        ),

                        Divider(height: 1,color: Colors.black54,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("SurjoMuki",style: TextStyle(color: Colors.black54,fontSize: 17),),

                            Text("35",style: TextStyle(color: Colors.black54,fontSize: 17),),
                            Text("8.15pm",style: TextStyle(color: Colors.black54,fontSize: 17),)


                          ],
                        ),

                        Divider(height: 1,color: Colors.black54,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("SurjoMuki",style: TextStyle(color: Colors.black54,fontSize: 17),),

                            Text("20",style: TextStyle(color: Colors.black54,fontSize: 17),),
                            Text("5.15am",style: TextStyle(color: Colors.black54,fontSize: 17),)


                          ],
                        ),

                        Divider(height: 1,color: Colors.black54,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("SurjoMuki",style: TextStyle(color: Colors.black54,fontSize: 17),),

                            Text("21",style: TextStyle(color: Colors.black54,fontSize: 17),),
                            Text("4.15am",style: TextStyle(color: Colors.black54,fontSize: 17),)


                          ],
                        ),

                        // Divider(height: 1,color: Colors.black54,),




                      ],

                    ),


                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Text("From Main Campus",style: TextStyle(fontSize: 20,color: Colors.blue),),


                        SizedBox(height: 7,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("Bus Name",style: TextStyle(fontSize: 17,color: Colors.blue),),

                            Text("Bus Number",style: TextStyle(fontSize: 17,color: Colors.blue),),
                            Text("Start Time",style: TextStyle(fontSize: 17,color: Colors.blue),)


                          ],
                        ),

                        Divider(height: 5,color: Colors.blue,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("SurjoMuki",style: TextStyle(color: Colors.black54,fontSize: 17),),

                            Text("31",style: TextStyle(color: Colors.black54,fontSize: 17),),
                            Text("5.15pm",style: TextStyle(color: Colors.black54,fontSize: 17),)


                          ],
                        ),

                        Divider(height: 1,color: Colors.black54,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("SurjoMuki",style: TextStyle(color: Colors.black54,fontSize: 17),),

                            Text("32",style: TextStyle(color: Colors.black54,fontSize: 17),),
                            Text("6.15pm",style: TextStyle(color: Colors.black54,fontSize: 17),)


                          ],
                        ),

                        Divider(height: 1,color: Colors.black54,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("SurjoMuki",style: TextStyle(color: Colors.black54,fontSize: 17),),

                            Text("33",style: TextStyle(color: Colors.black54,fontSize: 17),),
                            Text("7.15pm",style: TextStyle(color: Colors.black54,fontSize: 17),)


                          ],
                        ),

                        Divider(height: 1,color: Colors.black54,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("SurjoMuki",style: TextStyle(color: Colors.black54,fontSize: 17),),

                            Text("35",style: TextStyle(color: Colors.black54,fontSize: 17),),
                            Text("8.15pm",style: TextStyle(color: Colors.black54,fontSize: 17),)


                          ],
                        ),

                        Divider(height: 1,color: Colors.black54,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("SurjoMuki",style: TextStyle(color: Colors.black54,fontSize: 17),),

                            Text("20",style: TextStyle(color: Colors.black54,fontSize: 17),),
                            Text("5.15am",style: TextStyle(color: Colors.black54,fontSize: 17),)


                          ],
                        ),

                        Divider(height: 1,color: Colors.black54,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("SurjoMuki",style: TextStyle(color: Colors.black54,fontSize: 17),),

                            Text("21",style: TextStyle(color: Colors.black54,fontSize: 17),),
                            Text("4.15am",style: TextStyle(color: Colors.black54,fontSize: 17),)


                          ],
                        ),

                        // Divider(height: 1,color: Colors.black54,),




                      ],

                    ),


                  ),
                ),
              ),
            ),




            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Text("From Uttora Campus",style: TextStyle(fontSize: 20,color: Colors.blue),),


                        SizedBox(height: 7,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("Bus Name",style: TextStyle(fontSize: 17,color: Colors.blue),),

                            Text("Bus Number",style: TextStyle(fontSize: 17,color: Colors.blue),),
                            Text("Start Time",style: TextStyle(fontSize: 17,color: Colors.blue),)


                          ],
                        ),

                        Divider(height: 5,color: Colors.blue,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("SurjoMuki",style: TextStyle(color: Colors.black54,fontSize: 17),),

                            Text("31",style: TextStyle(color: Colors.black54,fontSize: 17),),
                            Text("5.15pm",style: TextStyle(color: Colors.black54,fontSize: 17),)


                          ],
                        ),

                        Divider(height: 1,color: Colors.black54,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("SurjoMuki",style: TextStyle(color: Colors.black54,fontSize: 17),),

                            Text("32",style: TextStyle(color: Colors.black54,fontSize: 17),),
                            Text("6.15pm",style: TextStyle(color: Colors.black54,fontSize: 17),)


                          ],
                        ),

                        Divider(height: 1,color: Colors.black54,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("SurjoMuki",style: TextStyle(color: Colors.black54,fontSize: 17),),

                            Text("33",style: TextStyle(color: Colors.black54,fontSize: 17),),
                            Text("7.15pm",style: TextStyle(color: Colors.black54,fontSize: 17),)


                          ],
                        ),

                        Divider(height: 1,color: Colors.black54,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("SurjoMuki",style: TextStyle(color: Colors.black54,fontSize: 17),),

                            Text("35",style: TextStyle(color: Colors.black54,fontSize: 17),),
                            Text("8.15pm",style: TextStyle(color: Colors.black54,fontSize: 17),)


                          ],
                        ),

                        Divider(height: 1,color: Colors.black54,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("SurjoMuki",style: TextStyle(color: Colors.black54,fontSize: 17),),

                            Text("20",style: TextStyle(color: Colors.black54,fontSize: 17),),
                            Text("5.15am",style: TextStyle(color: Colors.black54,fontSize: 17),)


                          ],
                        ),

                        Divider(height: 1,color: Colors.black54,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("SurjoMuki",style: TextStyle(color: Colors.black54,fontSize: 17),),

                            Text("21",style: TextStyle(color: Colors.black54,fontSize: 17),),
                            Text("4.15am",style: TextStyle(color: Colors.black54,fontSize: 17),)


                          ],
                        ),

                        // Divider(height: 1,color: Colors.black54,),




                      ],

                    ),


                  ),
                ),
              ),
            )


          ],

        ),

      ),

    );
  }
}

