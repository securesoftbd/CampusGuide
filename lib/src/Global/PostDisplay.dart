import 'package:flutter/material.dart';

class PostDisply extends StatefulWidget {
  final title;
  final image_list;

  PostDisply({this.title, this.image_list});

  @override
  _PostDisplyState createState() => _PostDisplyState();
}

class _PostDisplyState extends State<PostDisply> {
  PageController _pageController;

  List image_list=new List();


  var current_slider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pageController = new PageController(initialPage: 0, viewportFraction: 0.9) ..addListener(() {
      setState(() {});
    });

     image_list=widget.image_list;
  }

  @override
  Widget build(BuildContext context) {



    //print("Currrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrnt   ${current_slider}");
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          body: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Container(
                  width: 320,
                  height: 200,
                  child: PageView.builder(
                      itemCount: widget.image_list.length,

                      onPageChanged: (int page) {

                        setState(() {

                          current_slider=page;


                        });
                      },
                      controller: _pageController,

                      itemBuilder: (BuildContext context, int index) {



                        //  print(index);



                        return image_slider(index);
                      })),

/*
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Row(
                   // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: image_list.map((i){
                    //  print(current_slider);
                     // print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ${getIndex(i.toString())}");
                      //print("  Valueeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee ${i}");

                     print("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB ${ image_list.indexOf(i)}");

                     return   image_list.indexOf(i) ==  current_slider ? Padding(
                       padding: const EdgeInsets.all(5.0),
                       child: Container(

                          width: 10,
                          height: 10,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.blue)
                          ),
                         child: Container(
                           width: 3,
                           height: 3,
                           decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               color: Colors.green
                           ),
                         ),

                       ),
                     ):Padding(
                       padding: const EdgeInsets.all(5.0),
                       child: Container(
                         width: 10,
                         height: 10,
                         decoration: BoxDecoration(

                             shape: BoxShape.circle,
                             border: Border.all(color: Colors.blue)

                         ),
                         
                       ),
                     );

                    }).toList()

                  ),
                ),
              ),*/

              SizedBox(
                height: 15,
              ),
             Expanded(
               child: SingleChildScrollView(
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                     widget.title,
                     style: TextStyle(fontSize: 18, letterSpacing: 0.4),
                   ),
                 ),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }

  Widget image_slider(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, widget) {
        double value = 1;

        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }

      //  print(" _pageController.page.toInt()  ${_pageController.page.toInt()} ");
        //print(" _pageController.position   ${_pageController.position} ");

     // setState(() {


          //current_slider=_pageController.page.toInt();

      // });

        return Center(
          child: SizedBox(
            width: Curves.easeInOut.transform(value) * 400,
            height: Curves.easeInOut.transform(value) * 200,
            child: widget,
          ),
        );
      },
      child: Container(



        margin: EdgeInsets.all(8),
        child: Image.network(
          widget.image_list[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  
  

}
