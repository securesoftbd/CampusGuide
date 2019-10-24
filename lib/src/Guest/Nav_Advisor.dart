import 'package:flutter/material.dart';

class Course_Advisor extends StatelessWidget {


  List teacher_name = [
   // "Prof. Dr. Syed Akhter Hossain Head",
  //  "Dr. S. M. Aminul Haque",
    "Mr. Anisur Rahman",
    "Ms. Nazmun Nessa Moon",
    "Dr. Masud Rana Rashel",
    "Mr. Md. Tanvir Rahman",
    "Mr. Md. Reduanul Haque",
    "Mr. Ohidujjaman",
    "Ms. Tania Khatun",
    "Ms. Farzana Akter",
    "Ms. Amatul Bushra Akhi",
    "Mr. Sheikh Abujar",
    "Mr. Md. Mahfujur Rahman",
    "Mr. Saif Mahmud Parvez",
    "Mr. Tajim Md. Niamat Ullah Akhund",

  ];


  List teacher_image = [

  //  "http://faculty.daffodilvarsity.edu.bd/images/teacher/699993c6db60de73aecbf238d5953462.jpg",


   // "http://faculty.daffodilvarsity.edu.bd/images/teacher/c05d1e45e5b13dfda27f31641ead6085.JPG",

    "http://faculty.daffodilvarsity.edu.bd/images/teacher/093c395f1d8aadd73545035d050e2011.jpg",

    "http://faculty.daffodilvarsity.edu.bd/images/teacher/8a0ecb2301d94830f09d8e900fbf1cba.JPG",

    "http://faculty.daffodilvarsity.edu.bd/images/teacher/d38a977c284c188b0cbd56f7981cf04c.gif",
    "http://faculty.daffodilvarsity.edu.bd/images/teacher/9c17444a6676b59e93d386738a551ecc.JPG",
    "http://faculty.daffodilvarsity.edu.bd/images/teacher/f4b5898e0bb6f1b7c25b69d214a075bb.JPG",

    "http://faculty.daffodilvarsity.edu.bd/images/teacher/67291ddb78149eab8aa99e57b4a10be4.JPG",

    "http://faculty.daffodilvarsity.edu.bd/images/teacher/5c37fa97a8de8af351c6a687aebbf0aa.JPG",
    "http://faculty.daffodilvarsity.edu.bd/images/teacher/0fef1e568430bd1c9c8402da7ed53a85.png",
    "http://faculty.daffodilvarsity.edu.bd/images/teacher/45c779784dd22b468df2d6963c8a71b1.JPG",
    "http://faculty.daffodilvarsity.edu.bd/images/teacher/70ef68002a9692fd61b779b997c749e8.jpg",
    "http://faculty.daffodilvarsity.edu.bd/images/teacher/7fd4cf8e651df17b7be83203c821c136.jpg",
    "http://faculty.daffodilvarsity.edu.bd/images/teacher/d1f80cdf830670e1e4d48b887a8e8e68.gif",
    "http://faculty.daffodilvarsity.edu.bd/images/teacher/0b47ce916ad9c163dfbc615f4a02566b.gif",

  ];



  List designation = [

   // "Head",

   // "Associate Professor",
    "Assistant Professor",
    "Assistant Professor",
    "Assistant Professor",
    "Lecturer (Senior Scale)",
    "Lecturer (Senior Scale)",
    "Lecturer (Senior Scale)",
    "Lecturer (Senior Scale)",
    "Lecturer (Senior Scale)",
    "Lecturer",
    "Lecturer",
    "Lecturer",
    "Lecturer",
    "Lecturer",


  ];




  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(

        appBar: AppBar(
          title: Text("Course Advisor"),
          leading:InkWell(

              onTap: (){

                Navigator.pop(context);

              },
              child: new Icon(Icons.arrow_back)),

        ),


        body: ListView.builder(physics: BouncingScrollPhysics(),itemCount: teacher_name.length,itemBuilder: (context,int index){

          return Card(

            child: Container(

              height: 70,

              child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  //Image




                  SizedBox(width: 10,),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(

                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage(teacher_image[index]),fit: BoxFit.cover)

                    ),

                  ),


                  SizedBox(width: 10,),
                Column(
                  children: <Widget>[

                    Container(height: 13,),

                    Text(teacher_name[index],style: TextStyle(fontSize: 14,),),
                    Text(designation[index],style: TextStyle(fontSize: 10,color: Colors.black54)),
                    Text("Permenant Campus",style: TextStyle(fontSize: 10,color: Colors.black54)),


                  ],

                ),

                Spacer(),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.phone),
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
