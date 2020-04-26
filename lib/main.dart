import 'package:flutter/material.dart';
import 'package:flutterarchbloc/screen/bloc/user_bloc_screen.dart';

import 'data/repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Architecture demo',
      home: HomePage(Repository()),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage(this._repository);

  final Repository _repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose demo'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.00),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                child: const Text(
                  'BLOC',
                ),
                onPressed: () {
                  openBloc(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openBloc(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserBlocScreen(_repository),
      ),
    );
  }
}