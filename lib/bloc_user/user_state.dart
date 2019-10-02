import 'package:equatable/equatable.dart';
import 'package:lost_and_found/model/user.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserState extends Equatable{
  UserState([List props = const[]]) : super(props);
}

class InitialUserState extends UserState {}

class UserLoaded extends UserState{
  User user;


  UserLoaded(this.user) : super([user]);
}