import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stolik_dla_ciebie/database/database.dart';
import 'package:stolik_dla_ciebie/home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified){
      timer.cancel();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage()));
      await DatabasService(uid: user.uid).updateUserData('imie', 'Opis zamówienia', 0, (DateTime(2021,1,1,12,00)), 000000000,(DateTime(2021,1,1,14,00)));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Text('Wiadomość Email została wysłana na ${user.email} proszę o potwierdzenie'),
      ),
    );
  }

}
