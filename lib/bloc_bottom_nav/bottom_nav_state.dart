import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BottomNavState extends Equatable {
  BottomNavState([List props= const[]]) : super(props);
}

class InitialBottomNavState extends BottomNavState {}


class ChangeIndexState extends BottomNavState{
  int index;
  ChangeIndexState(this.index) : super([index]);
}