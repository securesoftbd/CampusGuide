import 'package:flutter/material.dart';

class Hostel_Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        
        appBar: AppBar(
          
          title: Text("Hostel"),
          
          leading: Icon(Icons.arrow_back),
          
          
        ),
        
        
        body: Center(
          
          child: Text("Hostel Info "),
          
        ),
        
      ),
      
    );
  }
}

