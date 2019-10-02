import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lost_and_found/model/post_body.dart';
import 'package:lost_and_found/provider/base_provider.dart';
import 'dart:async';

class PostProvider extends BasePostProvider{


  @override
  Stream<List<PostBody>> getPosts()  {
    return Firestore.instance.collection('Posts').orderBy('timestamp', descending: true).snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => PostBody.fromSnapshot(doc))
          .toList();
    });
  }



}