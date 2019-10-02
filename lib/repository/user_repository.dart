
import 'package:lost_and_found/model/user.dart';
import 'package:lost_and_found/provider/user_provider.dart';

class UserRepository{
  UserProvider _provider = UserProvider();
  Future<User> getUser(String uid) => _provider.getUser(uid);
}