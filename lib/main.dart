import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stolik_dla_ciebie/authenticate/login.dart';
import 'package:stolik_dla_ciebie/restauracje/wloska.dart';
import 'package:stolik_dla_ciebie/home/home.dart';
import 'package:stolik_dla_ciebie/restauracje/amerykanska.dart';
import 'package:stolik_dla_ciebie/restauracje/gruzinska.dart';

import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => LoginScreen(),
      '/home': (context) => MyHomePage(),
      '/wloska': (context) => Wloska(),
      '/amerykanska': (context) => Amerykanska(),
      '/gruzinska': (context) => Gruzinska(),
    },
    theme: ThemeData(
      accentColor: Colors.orange,
      primarySwatch: Colors.red,
    ),
  ));
}


