import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BottomNavEvent extends Equatable{
  BottomNavEvent([List props = const[]]) : super(props);
}

class MoveIndex extends BottomNavEvent{
  int index;

  MoveIndex(this.index) : super([index]);
}