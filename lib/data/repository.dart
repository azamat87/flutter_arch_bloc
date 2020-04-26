import 'dart:async';
import 'package:flutterarchbloc/data/user.dart';

class Repository {
  Future<User> getUser() async {
    await Future.delayed(Duration(seconds: 2));
    return User(name: 'John', surname: 'Smith');
  }
}