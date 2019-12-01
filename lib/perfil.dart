import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Perfil  extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PerfilState();
}
class PerfilState  extends State<Perfil> {

  FirebaseUser _user;

  _loadUser() async {
    var user = await FirebaseAuth.instance.currentUser();
    setState(() {
      _user = user;
    });
  }
  
  @override
  void initState() {
    super.initState();
    _loadUser();    
  }
  
  @override 
  Widget build(BuildContext context) {

    _loadUser();
    
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    //final String imgUrl = 'https://pixel.nymag.com/imgs/daily/selectall/2017/12/26/26-eric-schmidt.w700.h700.jpg';

    return new Stack(children:[
      new Scaffold(
          appBar: new AppBar(
            title: new Text('Perfil'),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.black,
          ),
          //drawer: new Drawer(child: new Container(),),
          backgroundColor: Colors.lightBlue[200],
          body: new Center(
            child: new Column(
              children: [
                new SizedBox(height: _height/12,),
                new CircleAvatar(radius:_width<_height? _width/4:_height/4, backgroundImage: _user.photoUrl == null ? AssetImage('assets/imagens/logomarca.png') : NetworkImage(_user.photoUrl)),
                new SizedBox(height: _height/25.0,),
                _user == null 
                ? CircularProgressIndicator():
                Text('Olá ' + _user.displayName, style: new TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.white),),
                //new Padding(padding: new EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8),
                  //child:new Text('Snowboarder, Superhero and writer.\nSometime I work at google as Executive Chairman ',
                    //style: new TextStyle(fontWeight: FontWeight.normal, fontSize: _width/25,color: Colors.white),textAlign: TextAlign.center,) ,),
                new Divider(height: _height/30,color: Colors.white,),
                new Row(
                  children:[
                    Text(' Obrigado por fazer parte desta História' , style: new TextStyle(fontWeight: FontWeight.bold, fontSize: _width/18.3, color: Colors.white, ),),
                ]),
                new Divider(height: _height/30,color: Colors.white),
                new Padding(padding: new EdgeInsets.only(left: _width/8, right: _width/8), child: new FlatButton(onPressed: (){Navigator.of(context).pushNamed('/atividades');},
                  child: new Container(child: new Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                    new Icon(Icons.person),
                    new SizedBox(width: _width/30,),
                    new Text('Atividades')],)),color: Colors.blue[50],),),
                new Padding(padding: new EdgeInsets.only(left: _width/8, right: _width/8), child: new FlatButton(onPressed: (){Navigator.of(context).pushNamed('/perguntasblog');},
                  child: new Container(child: new Row( mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                    new Icon(Icons.person),
                    new SizedBox(width: _width/30,),
                    new Text('Perguntas Sobre o Tema'),],)),color: Colors.blue[50],),),
                    new Padding(padding: new EdgeInsets.only(left: _width/8, right: _width/8), child: new FlatButton(onPressed: (){Navigator.of(context).pushNamed('/camera');},
                  child: new Container(child: new Row( mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                    new Icon(Icons.person),
                    new SizedBox(width: _width/30,),
                    new Text('Escolher Foto de Perfil'),],)),color: Colors.blue[50],),),
              ],
            ),
          )
      )
    ],);
  }
}