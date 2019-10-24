import 'package:flutter/material.dart';
import 'package:search_widget/search_widget.dart';


class Nav_Teacher extends StatefulWidget {
  @override
  _Nav_TeacherState createState() => _Nav_TeacherState();
}

class _Nav_TeacherState extends State<Nav_Teacher> {


  var _text_controller=new TextEditingController();


   String _prev_search_text="";
   String _search_text="";





   List _search_name=new List();
   List _search_image=new List();
   List _search_designation=new List();


  List teacher_name = [
    "Prof. Dr. Syed Akhter Hossain Head",
    "Dr. S. M. Aminul Haque",
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

    "http://faculty.daffodilvarsity.edu.bd/images/teacher/699993c6db60de73aecbf238d5953462.jpg",
    "http://faculty.daffodilvarsity.edu.bd/images/teacher/c05d1e45e5b13dfda27f31641ead6085.JPG",
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

    "Head",

    "Associate Professor",
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

    print("Text  :  ${_search_text}");

  //  _prev_search_text =_search_text;






    if(_search_text !="" && _prev_search_text!=_search_text ){

      _search_name.clear();
      _search_designation.clear();
      _search_image.clear();

      for(int i=0;i < teacher_name.length;i++){

        if(teacher_name[i].toString().toLowerCase().contains(_search_text.toLowerCase())){

          _search_name.add(teacher_name[i]);

          _search_image.add(teacher_image[i]);
          _search_designation.add(designation[i]);

        }

      }

    }else{

      _search_name.clear();
      _search_designation.clear();
      _search_image.clear();
    }

    return MaterialApp(

      home: Scaffold(

        appBar: AppBar(

          leading: InkWell(
              onTap: (){
                Navigator.pop(context);

              },

              child: new Icon(Icons.arrow_back)),

          title: Text("Teacher"),

        ),

        body: Column(
          children: <Widget>[


            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green,width: 1)
                ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 7,right: 7),
                  child: TextField(

                      controller: _text_controller,
                      onChanged: (text){

                        print("Text  onChange ${text}");

                        setState(() {

                          _search_name.clear();
                          _search_designation.clear();
                          _search_image.clear();


                          _search_text=text;

                          print("Text.................runing    ${_search_text}");

                          _prev_search_text=_search_text.substring(0,_search_text.length-1);

                          print("Text.................privious  ${_prev_search_text}");


                        });


                      },


                      decoration: InputDecoration(
                      disabledBorder:InputBorder.none ,

                      hintText: "Search Teacher",
                      suffixIcon:Icon(Icons.search),


                      border: InputBorder.none,
                    /*  enabledBorder: const OutlineInputBorder(

                        borderSide: const BorderSide(color: Colors.blue, width: 1.0),

                      ),
*/

                    ),
                  ),
                ),
              ),
            ),




            Expanded(
              child: _search_text==""? GridView.builder(

                physics: BouncingScrollPhysics(),
                itemCount: designation.length,
                gridDelegate:
                new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),

                itemBuilder: (context,int index){

                  return Container(

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 0.5),

                      color: Colors.white,

                    ),

                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[


                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(teacher_image[index])

                              )

                          ),

                        ),

                        SizedBox(height: 3,),

                        Text(teacher_name[index],textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),

                        SizedBox(height: 5,),

                        Text(designation[index],textAlign: TextAlign.center,style: TextStyle(fontSize: 12),),

                      ],

                    ),

                  );

                },




              ) : GridView.builder(

                physics: BouncingScrollPhysics(),
                itemCount: _search_name.length,
                gridDelegate:
                new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),

                itemBuilder: (context,int index){

                  return Container(

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 0.5),

                      color: Colors.white,

                    ),

                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[


                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(_search_image[index])

                              )

                          ),

                        ),

                        SizedBox(height: 3,),

                        Text(_search_name[index],textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),

                        SizedBox(height: 5,),

                        Text(_search_designation[index],textAlign: TextAlign.center,style: TextStyle(fontSize: 12),),

                      ],

                    ),

                  );

                },




              )
            ),

          ],
        ),
      ),

    );
  }
}


/*class Teacher extends StatelessWidget {


//  List<TeacherModel> _teacher_list=new List();


  List teacher_name = [
    "Prof. Dr. Syed Akhter Hossain Head",
    "Dr. S. M. Aminul Haque",
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

    "http://faculty.daffodilvarsity.edu.bd/images/teacher/699993c6db60de73aecbf238d5953462.jpg",
    "http://faculty.daffodilvarsity.edu.bd/images/teacher/c05d1e45e5b13dfda27f31641ead6085.JPG",
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

    "Head",

    "Associate Professor",
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
          
          leading: InkWell(
              onTap: (){
                Navigator.pop(context);

              },

              child: new Icon(Icons.arrow_back)),
          
          title: Text("Teacher"),
          
        ),

        body: Column(
          children: <Widget>[


            TextField(

              decoration: InputDecoration(
                disabledBorder:InputBorder.none ,

                hintText: "Search Teacher",
                suffixIcon:Icon(Icons.search),


                border: InputBorder.none,
                enabledBorder: const OutlineInputBorder(

                  borderSide: const BorderSide(color: Colors.blue, width: 0.0),

                ),


              ),
            ),




            Expanded(
              child: GridView.builder(

                physics: BouncingScrollPhysics(),
                itemCount: designation.length,
                gridDelegate:
                new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),

                itemBuilder: (context,int index){

                  return Container(

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 0.5),

                      color: Colors.white,

                    ),

                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[


                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(teacher_image[index])

                              )

                          ),

                        ),

                        SizedBox(height: 3,),

                        Text(teacher_name[index],textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),

                        SizedBox(height: 5,),

                        Text(designation[index],textAlign: TextAlign.center,style: TextStyle(fontSize: 12),),

                      ],

                    ),

                  );

                },




              ),
            ),

          ],
        ),
      ),

    );
  }*/



































/*

   for(int i=0;i<teacher_name.length;i++){


      _teacher_list.add(new TeacherModel(teacher_name[i],teacher_image[i]));


    }

class TeacherModel {

  String _name;
  String _image;


  TeacherModel(_name,_image){

    this._name=_name;
    this._image=_image;
  }

}



Widget  NoItemsFound() {

    return Center(

      child: CircularProgressIndicator(),
    );

}

  Widget SelectedItemWidget(TeacherModel selectedItem, deleteSelectedItem) {

    return Container(

      child: Column(
        children: <Widget>[

          Image.network(selectedItem._image),

          Text(selectedItem._name)


        ],

      ),

    );

  }


}

Widget PopupListItemWidget(TeacherModel item) {

  return    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(item._name,style: TextStyle(color: Colors.black54,fontSize: 15),textAlign: TextAlign.center,),
  );
}

* SearchWidget<TeacherModel>(
              dataList: _teacher_list,
              hideSearchBoxWhenItemSelected: false,
              listContainerHeight: MediaQuery.of(context).size.height / 2,
              queryBuilder: (String query, List<TeacherModel> list) {
                return list.where((TeacherModel item) => item._name.toLowerCase().contains(query.toLowerCase())).toList();
              },
              popupListItemBuilder: (TeacherModel item) {
                return PopupListItemWidget(item);
              },
              selectedItemBuilder: (TeacherModel selectedItem, VoidCallback deleteSelectedItem) {

                return SelectedItemWidget(selectedItem, deleteSelectedItem);
              },
              // widget customization
              noItemsFoundWidget: NoItemsFound(),


              textFieldBuilder: (TextEditingController controller, FocusNode focusNode) {


                //  focusNode.addListener(_focus(focusNode));


                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: controller,
                      focusNode: focusNode,


                      decoration: InputDecoration(
                        disabledBorder:InputBorder.none ,

                        hintText: "Search Teacher",
                        suffixIcon:Icon(Icons.search),


                        border: InputBorder.none,
                        enabledBorder: const OutlineInputBorder(

                          borderSide: const BorderSide(color: Colors.blue, width: 0.0),

                        ),


                      ),
                    ),

                );
              },
            ),
*
* */
