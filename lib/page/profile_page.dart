import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_and_found/bloc_user/bloc.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);
    bloc.dispatch(GetUser('Ru5y03IdM3RSGvT2oZgMv27DOZP2'));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context,state) {
          if(state is InitialUserState){
            return CircularProgressIndicator();
          }else if(state is UserLoaded){
            print('asdasdsad ${state.user.name}');
            return Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Text(state.user.img)
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
