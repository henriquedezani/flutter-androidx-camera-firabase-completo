import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'perfil.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

 
class _LoginPageState extends State<Login> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

   String email = '';
  String senha = '';
  BuildContext _context;

  Future _login() async {

    try {

      await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha);
        // .createUserWithEmailAndPassword(email: email, password: senha);
      // MaterialPageRoute(builder: (context) => Perfil());
      Navigator.of(_context).pushNamed("/perfil");

    } on Exception catch(e) {
      print('ERRO: ' + e.toString());
    }
  }

@override
  Widget build(BuildContext context) {

    this._context = context;

    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.lightBlue[200],
    body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Form(
          key: this._formKey,
          child: new ListView(
            children: [
              new TextFormField(
                keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                decoration: new InputDecoration(
                  hintText: 'Digite seu E-mail',
                  labelText: 'E-mail '
                ),
                onSaved: (value) => email = value,
              ),
            new TextFormField(
                obscureText: true, // Use secure text for passwords.
                decoration: new InputDecoration(
                  hintText: 'Digite sua senha',
                  labelText: 'Senha'
                ),
                onSaved: (value) => senha = value,
              ),
            new Container(
                width: screenSize.width,
                child: new FlatButton(
                  child: new Text('Entrar',
                    style: new TextStyle(
                      color: Colors.black
                    ),
                  ),
                onPressed: (){
                _formKey.currentState.save();
                _login();
              },
                  color: Colors.grey,
                ),
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