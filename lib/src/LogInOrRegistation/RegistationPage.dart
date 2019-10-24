import 'package:campus_guide/src/LogInOrRegistation/Registation_for_student.dart';
import 'package:campus_guide/src/LogInOrRegistation/Regsitation_for_teacher.dart';
import 'package:flutter/material.dart';


class RegistationPage extends StatelessWidget {

  final page;


  RegistationPage(this.page);


  @override
  Widget build(BuildContext context) {

    if(page=="teacher"){
      return Registation_for_teacher();

    }else{

      return RegistationForStudent();
    }

  }

}







