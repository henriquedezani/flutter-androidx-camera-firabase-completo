import 'package:flutter/material.dart';


class Home  extends StatelessWidget {
  
  @override 

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true, // centralizar Titulo 
          title: Text("Te Guio TEA"),
          backgroundColor: Colors.black,
        ),
        //body:  //Image.asset('assets/imagens/logomarca.png'), //   <-- image

        body:  Container(  decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/imagens/fundook.png',), fit: BoxFit.cover),),
        //padding: new EdgeInsets.all(35.0),
          child: ListView(
            children: [ 
              Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height:400.0),
             Container(
                  width: 350.0,
                    child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                    //color: Color(0xffffffff),
                    color: Color.fromRGBO(200, 200, 200, 0.3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      //Icon(FontAwesomeIcons.google,color: Color(0xffCE107C),),
                      SizedBox(width:10.0),
                      Text('Saiba Mais Sobre o TEA',style: TextStyle(color: Colors.black,fontSize: 25.0),
                    ),
                    ],),
                    onPressed: (){Navigator.of(context).pushNamed('/sobre');},)
                      ),
                    ),
                  Container(
                  width: 200.0,
                    child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                    //color: Color(0xffffffff),
                    color: Color.fromRGBO(200, 200, 200, 0.3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      //Icon(FontAwesomeIcons.google,color: Color(0xffCE107C),),
                      SizedBox(width:10.0),
                      Text('Login',style: TextStyle(color: Colors.black,fontSize: 25.0),
                    ),
                    ],),
                    onPressed: (){Navigator.of(context).pushNamed('/login');},)
                      ),
                    ),
                  Container(
                  width: 200.0,
                    child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                    //color: Color(0xffffffff),
                    color: Color.fromRGBO(200, 200, 200, 0.3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      //Icon(FontAwesomeIcons.google,color: Color(0xffCE107C),),
                      SizedBox(width:10.0),
                      Text('Cadastre-se',style: TextStyle(color: Colors.black,fontSize: 25.0),
                    ),
                    ],),
                    onPressed: (){Navigator.of(context).pushNamed('/cadastro');},)
                      ),
                    ),
                    Container(
                  width: 200.0,
                    child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                    //color: Color(0xffffffff),
                    color: Color.fromRGBO(200, 200, 200, 0.3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      //Icon(FontAwesomeIcons.google,color: Color(0xffCE107C),),
                      SizedBox(width:10.0),
                      Text('Duvidas',style: TextStyle(color: Colors.black,fontSize: 25.0),
                    ),
                    ],),
                    onPressed: (){Navigator.of(context).pushNamed('/perguntas');},)
                      ),
                    )
                  ]
              ),
              //new Image.asset('assets/imagens/logomarca.png'),
              //new Row( children: [RaisedButton(child: Text('Login'), onPressed: (){Navigator.of(context).pushNamed('/login');},)],),
              //new Row( children: [RaisedButton(child: Text('Cadastre-se'), onPressed: (){ Navigator.of(context).pushNamed('/cadastro');},),],),
              //new Row( children: [RaisedButton(child: Text('Saiba Mais'), onPressed: (){ Navigator.of(context).pushNamed('/sobre');},),],),
              //new Row( children: [RaisedButton(child: Text('Duvidas'), onPressed: (){ Navigator.of(context).pushNamed('/perguntas');},),],)
            ]
          ),
        ),
    );
  }
}
