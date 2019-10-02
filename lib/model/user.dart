import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  String name;
  String img;
  User({this.name,this.img});

  factory User.fromSnapshot(DocumentSnapshot snapshot){
    return User(
        name: snapshot.data['name'],
        img:  snapshot.data['image']
    );
  }
}