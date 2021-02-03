import 'package:flutter/material.dart';
import 'package:stolik_dla_ciebie/home/home.dart';
import 'package:stolik_dla_ciebie/authenticate/login.dart';

class Gruzinska extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.logout), onPressed: (){
            auth.signOut();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
          })
        ],
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text('Stolik dla ciebie'),
      ),
    );
  }
}