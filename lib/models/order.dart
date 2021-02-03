import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  final String name;
  final String description;
  final int table;
  final Timestamp date;
  final int number;
  final Timestamp date_close;

  Order({this.name, this.description, this.table, this.date, this.number, this.date_close});

}