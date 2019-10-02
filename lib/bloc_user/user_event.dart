import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserEvent extends Equatable{
  UserEvent([List props = const[]]) : super(props);
}

class GetUsers extends UserEvent{

}

class GetUser extends UserEvent{
  String uid;
  GetUser(this.uid) : super([uid]);
}