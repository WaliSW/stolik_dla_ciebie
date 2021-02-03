import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stolik_dla_ciebie/models/user.dart';


class DatabasService{
  final String uid;
  DatabasService({this.uid});
  // collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  Future updateUserData(String name, String description, int table, DateTime date, int number, DateTime date_close) async
  {
    return await userCollection.doc(uid).set({
      'name' : name,
      'description' : description,
      'table' : table,
      'date' : date,
      'number' : number,
      'date_close' : date_close
    });
  }

  //user list from snapshot
  List<User> _userListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return User(
        name: doc.data()['name'] ?? '',
        description: doc.data()['description'] ?? '',
        table: doc.data()['table'] ?? 0,
        date: doc.data()['date'] ?? '',
        number: doc.data()['number'] ?? 0,
        date_close: doc.data()['date_close'] ?? '',
      );
    }).toList();
  }

  //get users stream
  Stream<List<User>> get users{
    return userCollection.snapshots()
    .map(_userListFromSnapshot);
  }
}