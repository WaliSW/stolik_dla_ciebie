import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stolik_dla_ciebie/database/database.dart';
import 'package:stolik_dla_ciebie/models/user.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> tables = ['1','2','3','4','5','6','7','8','9','10','11','12'];
  String _currentName;
  String _currentTable;
  String _currentDescription;
  Timestamp _currentDate;
  Timestamp _currentDate_close;
  String _currentNumber;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
      stream: DatabasService(uid: user.uid).userData,
      // ignore: missing_return
      builder: (context, snapshot) {
        if(snapshot.hasData)
          {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Text('Wprowadź dane rezerwacji',style: TextStyle(fontSize: 18.0),),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (val) => val.isEmpty ? 'Proszę wprowadzić imię' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 20,),
                  //dropdown
                  DropdownButtonFormField(
                    value: _currentTable ?? userData.table,
                    items: tables.map((table){
                      return DropdownMenuItem(
                        value: table,
                        child: Text('$table Stolik'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentTable = val),
                  ),
                  //slider
                  RaisedButton(onPressed: () async {
                    print(_currentName);
                    print(_currentTable);
                    print(_currentDescription);
                    print(_currentDate);
                    print(_currentDate_close);
                    print(_currentNumber);
                  },
                    color: Colors.deepOrange,
                    child: Text('Zaktualizuj'),
                  )
                ],
              ),
            );
          }else{

        }

      }
    );
  }
}
