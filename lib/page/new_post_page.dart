import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lost_and_found/model/post_body.dart';
import 'package:lost_and_found/provider/post_provider.dart';

class NewPostPage extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('New Post'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green,
        child: StreamBuilder<List<PostBody>>(
          stream: PostProvider().getPosts(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting: return new Text('Loading...');
              default:
                return new ListView.builder(
                  itemBuilder: (_,index){
                    return ListTile(
                      title: Text(snapshot.data[index].img),
                    );
                  },
                  itemCount: snapshot.data.length,
                );
            }
          },
        ),
      ),
    );
  }
}
