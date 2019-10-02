
import 'package:lost_and_found/model/post_body.dart';
import 'package:lost_and_found/model/user.dart';

abstract class BasePostProvider{
  Stream<List<PostBody>> getPosts();
}

abstract class BaseUserProvider{
  Future<User> getUser(String uid);
}