import 'package:equatable/equatable.dart';
import 'package:lost_and_found/model/post_body.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PostState extends Equatable {
  PostState([List props= const[]]) : super(props);
}

class InitialPostState extends PostState {

}
class PostsLoading extends PostState{}

class PostsLoaded extends PostState{
  List<PostBody> posts;

  PostsLoaded(this.posts) : super([posts]);
}