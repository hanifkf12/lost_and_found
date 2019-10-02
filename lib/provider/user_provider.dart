import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lost_and_found/model/user.dart';

import 'base_provider.dart';

class UserProvider extends BaseUserProvider{
  @override
  Future<User> getUser(String uid) async{
    DocumentSnapshot snapshot = await Firestore.instance.collection('Users').document(uid).get();
    if (snapshot != null &&
        snapshot.exists &&
        snapshot.data['name'] != null) {
      return User.fromSnapshot(snapshot);
    } else {
      throw Exception('Failed to get User');
    }
  }

}