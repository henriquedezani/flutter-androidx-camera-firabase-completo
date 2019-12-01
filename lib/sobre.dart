import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sobre"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.lightBlue[200],
      body: Container( child:ListView(children: [Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height:40.0),
              Container(child: Align(
                  alignment: Alignment.center,
                  child:Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text(' Transtorno do Espectro Autista (TEA)',style: TextStyle(color: Colors.black,fontSize: 24.0)),],
                    ),
                  ),
                ),
              SizedBox(height:20.0),
              Container(child: Align(
                  alignment: Alignment.center,
                  child:Column(
                  children: [Text(' Autismo, é um transtorno neurológico caracterizado por comprometimento da interação social, comunicação verbal e não verbal e comportamento restrito e repetitivo. Os sinais geralmente desenvolvem-se gradualmente, mas algumas crianças com autismo alcançam o marco de desenvolvimento em um ritmo normal e depois regridem.', maxLines: 10,style: TextStyle(color: Colors.black,fontSize: 24.0)),],
                    ),
                  ),
                )
              ]
            )
          ],
        )
      ),
    );
  }
}

//child: RaisedButton(
          //onPressed: () { 
            //Navigator.pop(context);
          //},
          //child: Text('Retornar !'),
        //),