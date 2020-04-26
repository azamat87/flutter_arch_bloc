import 'package:flutter/material.dart';
import 'package:flutterarchbloc/data/repository.dart';
import 'package:flutterarchbloc/data/user.dart';
import 'package:flutterarchbloc/screen/bloc/user_bloc.dart';

class UserBlocScreen extends StatefulWidget {
  UserBlocScreen(this._repository);
  final Repository _repository;

  @override
  State<StatefulWidget> createState() => _UserBlocScreenState();
}

class _UserBlocScreenState extends State<UserBlocScreen> {
  UserBloc _userBloc;

  @override
  void initState() {
    _userBloc = UserBloc(widget._repository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc'),
      ),
      body: SafeArea(
        child: StreamBuilder<UserState>(
          stream: _userBloc.user,
          initialData: UserInitState(),
          builder: (context, snapshot) {
            if (snapshot.data is UserInitState) {
              return _buildInit();
            }
            if (snapshot.data is UserDataState) {
              UserDataState state = snapshot.data;
              return _buildContent(state.user);
            }
            if (snapshot.data is UserLoadingState) {
              return _buildLoading();
            }
          },
        ),
      ),
    );
  }

  Widget _buildInit() {
    return Center(
      child: RaisedButton(
        child: const Text('Load user data'),
        onPressed: () {
          _userBloc.loadUserData();
        },
      ),
    );
  }

  Widget _buildContent(User user) {
    return Center(
      child: Text('Hello ${user.name} ${user.surname}'),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    _userBloc.dispose();
    super.dispose();
  }
}