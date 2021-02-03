import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stolik_dla_ciebie/models/user.dart';
import 'package:stolik_dla_ciebie/restauracje/wloska.dart';
class UserTile extends StatelessWidget {
  final User user;
  UserTile({this.user});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ListTile(
            title: Text(user.name),
            subtitle: Text('Stolik ${user.table}'),
          ),
    ),
    );
  }
}
