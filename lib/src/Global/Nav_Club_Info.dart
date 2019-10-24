import 'package:flutter/material.dart';

class ClubInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List club_name=[

      "Debating Club",
      "English Literary Club (ELC)",
      "DIU Textile Club (DIUTC)",
      "Computer and Programming Club (CPC)",
      "Girls’ Computer Programming Club.",
      "DIU Robotics Club (DIURC)",
      "Daffodil Moot Court Society (DMCS)",
      "Social Business Students Forum (SBSF)",
      "DIU Cyber Securiy Club",
      "DIU Change Together Club",
      "DIU Photographic Society",
      "Bangladesh National Cadet Corps (BNCC)",

    ];


    List club_captain_name=[

      "Rakib",
      "Alomgir Hosain",
      "Alamin",
      "Sofiq",
      "No Name",
      "No Name",
      "No Name",
      "No Name",
      "No Name",
      "No Name",
      "No Name",
      "No Name",

    ];

    List club_image=[

      "https://daffodilvarsity.edu.bd/images/clubs/diudc.png",
      "https://daffodilvarsity.edu.bd/images/clubs/elc.png",
      "https://daffodilvarsity.edu.bd/images/clubs/textile.png",
      "https://daffodilvarsity.edu.bd/images/clubs/cpc-logo.png",

      "https://daffodilvarsity.edu.bd/photos/other/gcpc.png",
      "https://daffodilvarsity.edu.bd/images/clubs/default.png",
      "https://daffodilvarsity.edu.bd/photos/other/law.png",
      "https://daffodilvarsity.edu.bd/images/clubs/sbsf.png",
      "https://daffodilvarsity.edu.bd/images/clubs/csc.png",
      "https://daffodilvarsity.edu.bd/images/clubs/change.png",
      "https://daffodilvarsity.edu.bd/images/clubs/ps.png",
      "https://daffodilvarsity.edu.bd/images/clubs/default.png",
    ];

    return MaterialApp(

      home: Scaffold(

        appBar: AppBar(

          title: Text("Calub Info"),
          leading:InkWell(

              onTap: (){

                Navigator.pop(context);

              },
              child: new Icon(Icons.arrow_back)),



        ),

        body: ListView.builder( physics: BouncingScrollPhysics() ,itemCount: club_name.length,itemBuilder: (context,int index){

          return  Card(

            child: Container(

              height: 70,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  //Image




                  SizedBox(width: 20,),




                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(height: 23,),

                      Text(club_name[index],style: TextStyle(fontSize: 14,),textAlign: TextAlign.start,),
                      SizedBox(height: 5,),
                      Text(club_captain_name[index],style: TextStyle(fontSize: 8,color: Colors.black54),textAlign: TextAlign.start,),
                    //  Text("Permenant Campus",style: TextStyle(fontSize: 10,color: Colors.black54)),


                    ],

                  ),

                  Spacer(),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(club_image[index],width: 50,height: 50,),
                  ),









                ],
              ),

            ),

          );

        }),

      ),

    );
  }
}
