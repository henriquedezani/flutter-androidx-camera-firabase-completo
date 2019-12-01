import 'package:flutter/material.dart';
import 'perfil.dart';
import 'sobre.dart';
import 'home.dart';
import 'login.dart';
import 'cadastro.dart';
import 'perguntas.dart';
import 'perguntasblog.dart';
import 'atividades.dart';
import 'camera.dart';


void main() => runApp(Teguio());

class Teguio extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    var routes = {
      '/camera' : (context) => Camera(),
      '/perguntasblog' : (context) => Perguntasblog(),
      '/atividades' : (context) => Atividades(),
      '/perguntas' : (context) => Perguntas(),
      '/login' : (context) => Login(),
      '/cadastro' : (context) => Cadastro(),
      '/sobre' : (context) => Sobre(),
      '/perfil' : (context) => Perfil(),
      '/' : (context) => Home(),
    };

    return MaterialApp(routes: routes, initialRoute: '/',);
  }  
}