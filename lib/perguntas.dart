import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class Perguntas extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new PerguntasState();
}

  var formKey = GlobalKey<FormState>();

  String email ;
  String nome ;
  String titulo ;
  String texto ;
  

class PerguntasState extends State<Perguntas> {
  //final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  //var formKey = GlobalKey<FormState>();

@override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Perguntas"),
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
                  hintText: 'Digite seu Nome',
                  labelText: 'Nome'
                ),
                  onSaved: (value) => nome = value,
              ),
              new TextFormField(
                keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                decoration: new InputDecoration(
                  hintText: 'Digite seu E-mail',
                  labelText: 'E-mail '
                ),
                 onSaved: (value) => email = value,
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  hintText: 'Digite um titulo',
                  labelText: 'Titulo'
                ),
                onSaved: (value) => titulo = value,
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

          Firestore.instance.collection('perguntas')
            .add( {'email': email,
                  'nome': nome,
                  'titulo': titulo,
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