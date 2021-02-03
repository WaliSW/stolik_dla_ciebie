import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
          )
        ],
      ),
    );
  }
}
