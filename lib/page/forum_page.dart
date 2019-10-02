import 'package:flutter/material.dart';

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Forum'),
        centerTitle: true,
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _controller,
          tabs: <Widget>[
            Tab(text: 'SAYA',),
            Tab(text: 'HILANG',),
            Tab(text: 'DITEMUKAN',)
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.grey,
          ),
          Container(
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}
