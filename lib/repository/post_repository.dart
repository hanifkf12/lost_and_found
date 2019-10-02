
import 'package:lost_and_found/model/post_body.dart';
import 'package:lost_and_found/provider/post_provider.dart';
import 'package:lost_and_found/repository/base_repository.dart';

class PostRepository extends BaseRepository{
  PostProvider postProvider = PostProvider();

  Stream<List<PostBody>> getPosts() => postProvider.getPosts();


  @override
  void dispose() {

  }

}