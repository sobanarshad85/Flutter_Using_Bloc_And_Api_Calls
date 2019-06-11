import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SignupBloc extends Object implements Base {
  final _usernameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _ageController = BehaviorSubject<String>();

  Stream<String> get username => _usernameController.stream;
  Stream<String> get email => _emailController.stream;
  Stream<String> get password => _passwordController.stream;
  Stream<String> get age => _ageController.stream;

  Function(String) get usernameChanged => _usernameController.sink.add;
  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;
  Function(String) get ageChanged => _ageController.sink.add;

  bool submitValidateion() {
    if (_usernameController.value != null &&
        _emailController.value != null &&
        _passwordController.value != null) {
      return true;
    }
    return false;
  }

  submit() {
    var details = {
      'Username is: ${_usernameController.value} Email is: ${_emailController.value} Password is: ${_passwordController.value} Age is: ${_ageController.value}'
    };
    return details;
  }

  void dispose() {
    _usernameController.close();
    _emailController.close();
    _passwordController.close();
    _ageController.close();
  }
}

abstract class Base {
  void dispose();
}
