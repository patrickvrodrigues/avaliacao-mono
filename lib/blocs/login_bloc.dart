import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:avaliacaomono/validators/login_validator.dart';
import 'package:rxdart/rxdart.dart';

enum LoginState {IDLE, LOADING, SUCCESS, FAIL}

class LoginBloc extends BlocBase with LoginValidators {

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _stateController = BehaviorSubject<LoginState>();
  final _uid = BehaviorSubject<String>();
  final _auth = FirebaseAuth.instance;
  String uidteste;

  Stream<String> get outEmail =>
      _emailController.stream.transform(validateEmail);

  Stream<String> get outPassword =>
      _passwordController.stream.transform(validatePassword);

  Stream<String> get outUid =>
      _passwordController.stream;

  Stream<LoginState> get outState => _stateController.stream;

  Stream<bool> get outSubmitValid =>
      Observable.combineLatest2(outEmail, outPassword, (a, b) => true);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  StreamSubscription _streamSubscription;

  LoginBloc() {
    _streamSubscription = FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      if (user != null) {
        _stateController.add(LoginState.SUCCESS);
        _uid.add(user.uid);
        uidteste = user.uid;
      } else {
        _stateController.add(LoginState.IDLE);
      }
    });
  }

  Future<String> getUid() async {
    FirebaseUser user = await _auth.currentUser();
    print(user.uid);
    return user.uid;
  }
  Future<void> submit() async {
    final email = _emailController.value;
    final password = _passwordController.value;

    print(">::::::");

    _stateController.add(LoginState.LOADING);


    _stateController.add(LoginState.LOADING);

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim()
    ).catchError((e) {
      _stateController.add(LoginState.FAIL);
      print("falhou");
    });
  }

  void logout() async {
    _stateController.add(LoginState.LOADING);
    await _auth.signOut();
    _stateController.add(LoginState.IDLE);
  }
  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    _stateController.close();
    _streamSubscription.cancel();
  }
}
