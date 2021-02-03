import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stolik_dla_ciebie/home/home.dart';
import 'package:stolik_dla_ciebie/authenticate/reset.dart';
import 'package:stolik_dla_ciebie/authenticate/verify.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
          title: Text('Stolik dla ciebie')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 70, 8, 8),
            child: TextField(

              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
              ),
              onChanged: (value){
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Hasło',
              ),
              onChanged: (value){
                setState(() {
                  _password = value.trim();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Zaloguj się'),
                onPressed: (){
                  auth.signInWithEmailAndPassword(email: _email, password: _password.trim()).then((_){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage()));
                  });
            }),
            RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Załóż konto'),
                onPressed: (){
                  auth.createUserWithEmailAndPassword(email: _email, password: _password.trim()).then((_){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VerifyScreen()));
                    }
                  );
                }
              )
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  child: (Text('Zapomniałeś hasła ?')),onPressed:() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResetScreen())))
            ],
          )
        ],
      ),
    );
  }
}
