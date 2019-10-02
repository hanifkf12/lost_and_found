import 'package:flutter/material.dart';
class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Notification'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}
