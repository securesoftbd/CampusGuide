import 'package:flutter/material.dart';

class Admission extends StatefulWidget {
  @override
  _AdmissionState createState() => _AdmissionState();
}
class _AdmissionState extends State<Admission> {
  int _current_steps = 0;
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

          title: Text("Addmission"),
          
        ),

        body: SingleChildScrollView(
          child: Stepper(
            steps: _sipper(),
            currentStep: this._current_steps,
            onStepTapped: (step) {
              setState(() {
                _current_steps = step;
              });
            },
            onStepContinue: (){
              setState(() {
                if(this._current_steps <this._sipper().length -1){
                  this._current_steps=this._current_steps +1;
                }else{
                }
              });
            },
            onStepCancel: (){
              setState(() {
                if(this._current_steps>0){
                  this._current_steps=this._current_steps-1;
                }else{
                  this._current_steps=0;
                }
              });

            },
          ),

        ),
      ),
    );
  }

  List<Step> _sipper() {
    List<Step> _steps = [
      Step(
        title: new Container(
          child: Row(
            children: <Widget>[
              Image.asset("Img/fromfillup.png",width: 16,height: 16,),
              SizedBox(width: 10,),
              Text("FromFillUp"),
            ],
          ),
        ),
        content: Text("One of the oooo"),
        isActive: _current_steps >= 0,
      ),
      Step(
        title: new Container(
          child: Row(
            children: <Widget>[
              Image.asset("Img/exam.png",width: 16,height: 16,),
              SizedBox(width: 10,),
              Text("Exam"),
            ],
          ),
        ),
        content: ListView(
          shrinkWrap: true,
          
          scrollDirection: Axis.vertical,

          children: <Widget>[

            Text("I a monu"),
            Text("I a monu"),
            Text("I a monu"),
            Text("I a monu"),
            Text("I a monu"),
            Text("I a monu"),
            Text("I a monu"),
            Text("I a monu"),
            Text("I a monu"),
            Text("I a monu"),
            Text("I a monu"),
            Text("I a monu"),
            Text("I a monu"),
            Text("I a monu"),
            Text("I a monu"),
            Text("I a monu"),
            Text("I a monu"),
            Text("I a monu"),

          ],

        ),
        isActive: _current_steps >= 1,
      ),
      Step(
        title: new Container(
          child: Row(
            children: <Widget>[
              Image.asset("Img/result.png",width: 16,height: 16,),
              SizedBox(width: 10,),
              Text("Result"),
            ],
          ),
        ),
        content: Text("One of the oooo"),
        isActive: _current_steps >= 2,
      ),
      Step(
        title: new Container(
          child: Row(
            children: <Widget>[
           Image.asset("Img/registation.svg",width: 16,height: 16,),
              SizedBox(width: 10,),

              Text("Registation"),
            ],
          ),
        ),
        content: Text("One of the oooo"),
        isActive: _current_steps >= 3,
      ),
      Step(
        title: new Container(
          child: Row(
            children: <Widget>[
              Image.asset("Img/course_advisor.png",width: 13,height: 13,),
              SizedBox(width: 10,),
              Text("Course Avdisor"),
            ],
          ),
        ),
        content: Text("One of the oooo"),
        isActive: _current_steps >= 4,

      ),
    ];

    return _steps;
  }
}
