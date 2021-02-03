import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stolik_dla_ciebie/models/order.dart';
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
  List<Order> _userListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc){
      return Order(
        name: doc.data()['name'] ?? '',
        description: doc.data()['description'] ?? '',
        table: doc.data()['table'] ?? 0,
        date: doc.data()['date'] ?? '',
        number: doc.data()['number'] ?? 0,
        date_close: doc.data()['date_close'] ?? '',
      );
    }).toList();
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot)
  {
    return UserData(
      uid: uid,
      name: snapshot.data()['name'],
      description: snapshot.data()['description'],
      table: snapshot.data()['table'],
      date: snapshot.data()['date'],
      number: snapshot.data()['number'],
      date_close: snapshot.data()['date_close']
    );
  }

  //get users stream
  Stream<List<Order>> get users{
    return userCollection.snapshots()
    .map(_userListFromSnapshot);
  }
  // get user doc stream
  Stream<UserData> get userData{
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}