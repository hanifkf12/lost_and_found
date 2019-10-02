import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lost_and_found/model/user.dart';
import 'package:lost_and_found/provider/user_provider.dart';
import 'package:lost_and_found/repository/user_repository.dart';
import './bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository _repository = UserRepository();
  UserProvider _provider = UserProvider();
  @override
  UserState get initialState => InitialUserState();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is GetUser){
      User user = await _repository.getUser(event.uid);
      yield UserLoaded(user);
    }
  }
}
