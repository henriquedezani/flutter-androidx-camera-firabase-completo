import 'package:flutter/material.dart';


class Atividades  extends StatelessWidget {
  
  @override 

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true, // centralizar Titulo 
          title: Text("Atividades"),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.lightBlue[200],
    );
  }
}