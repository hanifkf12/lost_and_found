import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_and_found/bloc_bottom_nav//bloc.dart';
import 'package:lost_and_found/bloc_post/bloc.dart';
import 'package:lost_and_found/bloc_user/bloc.dart';
import 'package:lost_and_found/page/beranda_page.dart';
import 'package:lost_and_found/page/forum_page.dart';
import 'package:lost_and_found/page/new_post_page.dart';
import 'package:lost_and_found/page/notification_page.dart';
import 'package:lost_and_found/page/profile_page.dart';
import 'bloc_bottom_nav//bottom_nav_bloc.dart';
import 'bloc_bottom_nav//bottom_nav_event.dart';
import 'bloc_bottom_nav//bottom_nav_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<BottomNavBloc>(
          builder: (context) => BottomNavBloc()..dispatch(MoveIndex(0)),
          child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _body = [
    MultiBlocProvider(providers: [
      BlocProvider<PostBloc>(
        builder: (context) => PostBloc()..dispatch(GetPosts()),
      ),
      BlocProvider<UserBloc>(
        builder: (context) => UserBloc(),
      )
  ],
  child: BerandaPage()),
    ForumPage(),
    NewPostPage(),
    NotificationPage(),
    BlocProvider<UserBloc>(
        builder: (_)=> UserBloc(),
        child: ProfilePage())
  ];

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BottomNavBloc>(context);
    return SafeArea(child: _buildBlocProvider(bloc));
  }

  Widget _buildBlocProvider(BottomNavBloc bloc) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
      if (state is InitialBottomNavState) {
        return CircularProgressIndicator();
      } else if (state is ChangeIndexState) {
        return Scaffold(
          body: _body[state.index],
          bottomNavigationBar: BottomNavigationBar(
              showUnselectedLabels: false,
              showSelectedLabels: false,
              backgroundColor: Colors.black87,
              onTap: (index) {
                bloc.dispatch(MoveIndex(index));
              },
              type: BottomNavigationBarType.fixed,
              currentIndex: state.index,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.grey,
                    ),
                    activeIcon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Beranda',
                      style: TextStyle(color: Colors.white),
                    )),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.group,
                      color: Colors.white,
                    ),
                    icon: Icon(
                      Icons.group,
                      color: Colors.grey,
                    ),
                    title: Text('Forum')),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.add_circle,
                      color: Colors.white,
                    ),
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.grey,
                    ),
                    title: Text('Forum')),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.grey,
                    ),
                    title: Text('Notifikasi')),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    icon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    title: Text('Profil'))
              ]),
        );
      }
    });
  }
}
