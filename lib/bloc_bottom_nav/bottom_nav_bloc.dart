import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  @override
  BottomNavState get initialState => InitialBottomNavState();

  @override
  Stream<BottomNavState> mapEventToState (BottomNavEvent event,) async* {
    if(event is MoveIndex){
      yield ChangeIndexState(event.index);
    }
  }
}
