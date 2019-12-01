import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class Perguntasblog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new PerguntasblogState();
}

  var formKey = GlobalKey<FormState>();

  String tema ;
  String texto ;
  

class PerguntasblogState extends State<Perguntasblog> {
  //final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  //var formKey = GlobalKey<FormState>();

@override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Blog"),
        backgroundColor: Colors.black,
      ),
    backgroundColor: Colors.lightBlue[200], 
    body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Form(
          key: formKey,  
          child: new ListView(
            children: [
              new TextFormField(
                decoration: new InputDecoration(
                  hintText: 'Digite o tema',
                  labelText: 'tema'
                ),
                  onSaved: (value) => tema = value,
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  hintText: 'Digite sua duvida',
                  labelText: 'Duvida'
                ),
                onSaved: (value) => texto = value,
              ),
              new Container(
                width: screenSize.width,
                child: new RaisedButton(
                  child: new   Text('Enviar', 
                    style: new TextStyle(
                      color: Colors.black
                    ),
                  ),
                onPressed: () {
        if(formKey.currentState.validate())
        {
          formKey.currentState.save();

          Firestore.instance.collection('perguntasblog')
            .add( {'email': tema,
                  'texto': texto});

          Navigator.of(context).pop();
                        }
                      },
                    ),
                  color: Colors.grey,
                margin: new EdgeInsets.only(
                  top: 20.0
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}