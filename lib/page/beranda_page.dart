import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_and_found/bloc_post/bloc.dart';
import 'package:lost_and_found/bloc_user/bloc.dart';
import 'package:lost_and_found/model/post_body.dart';
import 'package:lost_and_found/model/user.dart';
import 'package:lost_and_found/provider/post_provider.dart';

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  @override
  Widget build(BuildContext context) {
    PostBloc bloc = BlocProvider.of<PostBloc>(context);
    UserBloc blocUser = BlocProvider.of<UserBloc>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text('Beranda'),
          centerTitle: true,
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is InitialPostState) {
              return Container();
            }
            else if (state is PostsLoading) {
              return _buildLoading();
            } else if (state is PostsLoaded) {
              return _buildBodyPost(state.posts, blocUser);
            }
          },
        )
    );
  }
}

Widget _buildLoading(){
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget _buildBodyPost(List<PostBody> posts, UserBloc bloc) {
  return ListView.builder(
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 8, top: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildProfilePost(posts[index].owner.name, posts[index].owner.img),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(posts[index].info, style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.red)),
                    Text(posts[index].category),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 8,),
          Padding(
              padding: const EdgeInsets.only(left: 1.0),
              child:
              CachedNetworkImage(
                  imageUrl: posts[index].img,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery
                      .of(context)
                      .size
                      .width * 0.7,
                  placeholder: (context, url) => CircularProgressIndicator()
              )
//             Image(
//               image: NetworkImage(posts.data[index].img),
//               fit: BoxFit.cover,
//               width: MediaQuery.of(context).size.width,
//               height:  MediaQuery.of(context).size.width*0.6,
//             ),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Container(
              width: double.infinity,
              child: Text(posts[index].deskripsi, textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14),
              ),

            ),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Container(
              width: double.infinity,
              child: Text(posts[index].lokasi, textAlign: TextAlign.start,
                style: TextStyle(fontSize: 11),
              ),

            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(

                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.favorite_border, color: Colors.red,),
                        SizedBox(width: 6,),
                        Text("2 Likes")
                      ],
                    ),
                  ),
                  onTap: () {

                  },
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.chat),
                      SizedBox(width: 6,),
                      Text("2 Comments")
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Divider()
        ],
      );
    },
    itemCount: posts.length,
  );
}

Widget _buildProfilePost(String name, String img) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(
              img ==null?
              'https://firebasestorage.googleapis.com/v0/b/lostandfound-1522046168814.appspot.com/o/profile_images%2FCM2ZeBI3RHa80eT5xIEQYyLGNqy2.jpg?alt=media&token=94a766cf-a419-4f02-b70d-34c1f56e4ca1' : img),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(name == null? "Posts" : name,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
            ],
          ),
        )
      ],
    ),
  );
}
