import 'package:equatable/equatable.dart';
import 'package:lost_and_found/model/post_body.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PostEvent extends Equatable{
  PostEvent([List props = const[]]) : super(props);
}

class GetPosts extends PostEvent{

}

class ShowPosts extends PostEvent{
  List<PostBody> posts;

  ShowPosts(this.posts) : super([posts]);
}