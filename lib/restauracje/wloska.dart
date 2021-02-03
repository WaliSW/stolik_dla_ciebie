import 'package:flutter/material.dart';
import 'package:stolik_dla_ciebie/home/home.dart';
import 'package:stolik_dla_ciebie/authenticate/login.dart';
import 'package:stolik_dla_ciebie/database/database.dart';
import 'package:provider/provider.dart';
import 'package:stolik_dla_ciebie/home/settings_form.dart';
import 'package:stolik_dla_ciebie/models/user_list.dart';
import 'package:stolik_dla_ciebie/models/user.dart';

class Wloska extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
       return Container(
         padding: EdgeInsets.symmetric(vertical: 20,horizontal: 60),
         child: SettingsForm(),
       );
      });
    }
    return StreamProvider<List<User>>.value(
        value: DatabasService().users,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(icon: Icon(Icons.logout), onPressed: (){
                auth.signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
              }),
              IconButton(onPressed: () => _showSettingsPanel(),icon: Icon(Icons.settings))
            ],
            backgroundColor: Colors.deepOrange,
            centerTitle: true,
            title: Text('Stolik dla ciebie'),
          ),
          body: UserList()

          )
        );
  }
  }



