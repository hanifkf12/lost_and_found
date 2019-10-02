import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:lost_and_found/model/post_body.dart';
import 'package:lost_and_found/model/user.dart';
import 'package:lost_and_found/repository/post_repository.dart';
import 'package:lost_and_found/repository/user_repository.dart';
import './bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  StreamSubscription chatsSubscription;
  PostRepository _postRepository = PostRepository();
  UserRepository _userRepository = UserRepository();
  @override
  PostState get initialState => InitialPostState();

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is GetPosts){
      yield* mapFetchChatListEventToState(event);
    }
    else if(event is ShowPosts){
      List<PostBody> postsBody = [];
      yield PostsLoading();
      for (PostBody p in event.posts){
        User owner = await _userRepository.getUser(p.user);
        p.setUser(owner);
        postsBody.add(p);
      }
      yield PostsLoaded(postsBody);
    }
  }



  Stream<PostState> mapFetchChatListEventToState(
      GetPosts event) async* {
    try {
      chatsSubscription?.cancel();
      chatsSubscription = _postRepository
          .getPosts()
          .listen((posts) => dispatch(ShowPosts(posts)));
    } catch (error){
      print('error saya '+error);
    }
  }
}
