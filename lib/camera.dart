import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';


class Camera extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => CameraState();
}

class CameraState extends State<Camera>
{
  //import 'dart:io';
  File imagem;

  Future tirarFoto() async {
    try {

      var _user = await FirebaseAuth.instance.currentUser();
      String _nomeimagem =_user.uid + ".png";

      final StorageReference storageReference = FirebaseStorage().ref().child(_nomeimagem);

            
      var _imagem = await ImagePicker.pickImage(source: ImageSource.gallery);

      final StorageUploadTask uploadTask = storageReference.putFile(_imagem);

      // final StreamSubscription<StorageTaskEvent> streamSubscription = uploadTask.events.listen((event) {
      //   // You can use this to notify yourself or your user in any kind of way.
      //   // For example: you could use the uploadTask.events stream in a StreamBuilder instead
      //   // to show your user what the current status is. In that case, you would not need to cancel any
      //   // subscription as StreamBuilder handles this automatically.

      //   // Here, every StorageTaskEvent concerning the upload is printed to the logs.
      //   print('EVENT ${event.type}');
      // });

      // Cancel your subscription when done.
      var upload = await uploadTask.onComplete;
      String url = await upload.ref.getDownloadURL();
      print(url);

      
      var _info = UserUpdateInfo();
      _info.photoUrl = url;
      await _user.updateProfile(_info);
      // streamSubscription.cancel();

      setState(() {
       imagem = _imagem; 
      });
      
    }
    on Exception catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Câmera App"),
        centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.lightBlue[200],
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            imagem == null ? Placeholder() : Image.file(imagem),
            RaisedButton(
              child: Text("Escolher Foto "),
              onPressed: tirarFoto
            )
          ],
        )
      )
    );
  }
}