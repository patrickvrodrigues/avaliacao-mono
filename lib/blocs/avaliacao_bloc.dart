import 'dart:async';

import 'package:avaliacaomono/validators/avaliacao_validator.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:avaliacaomono/validators/login_validator.dart';
import 'package:rxdart/rxdart.dart';

enum LoginState {IDLE, LOADING, SUCCESS, FAIL}

class LoginBloc extends BlocBase with AvaliacaoValidators {

  final _tituloController = BehaviorSubject<String>();
  final _nota1Controller = BehaviorSubject<String>();
  final _nota2Controller = BehaviorSubject<String>();
  final _nota3Controller = BehaviorSubject<String>();
  final _nota4Controller = BehaviorSubject<String>();
  final _nota5Controller = BehaviorSubject<String>();
  final _nota6Controller = BehaviorSubject<String>();
  final _nota7Controller = BehaviorSubject<String>();
  final _nota8Controller = BehaviorSubject<String>();
  final _nota9Controller = BehaviorSubject<String>();
  final _stateController = BehaviorSubject<LoginState>();
  final _auth = FirebaseAuth.instance;

  Stream<String> get outTitulo =>
      _tituloController.stream.transform(validateTitulo);

  Stream<String> get outNota1 =>
      _nota1Controller.stream.transform(validateNota1);
  Stream<String> get outNota2 =>
      _nota1Controller.stream.transform(validateNota2);
  Stream<String> get outNota3 =>
      _nota1Controller.stream.transform(validateNota3);
  Stream<String> get outNota4 =>
      _nota1Controller.stream.transform(validateNota4);
  Stream<String> get outNota5 =>
      _nota1Controller.stream.transform(validateNota5);
  Stream<String> get outNota6 =>
      _nota1Controller.stream.transform(validateNota6);
  Stream<String> get outNota7 =>
      _nota1Controller.stream.transform(validateNota7);
  Stream<String> get outNota8 =>
      _nota1Controller.stream.transform(validateNota8);
  Stream<String> get outNota9 =>
      _nota1Controller.stream.transform(validateNota9);

  Stream<LoginState> get outState => _stateController.stream;

  Stream<bool> get outSubmitValid =>
      Observable.combineLatest9(outTitulo,outNota1, outNota2,outNota3,outNota4,outNota5,outNota6,outNota7,outNota8, (a, b, c, d ,e,f,g,h,i) => true);



  StreamSubscription _streamSubscription;


  Future<void> submit() async {
    final bd = Firestore.instance;
    final titulo = _tituloController.value;
    final nota1 = _nota1Controller.value;
    final nota2 = _nota2Controller.value;
    final nota3 = _nota3Controller.value;
    final nota4 = _nota4Controller.value;
    final nota5 = _nota5Controller.value;
    final nota6 = _nota6Controller.value;
    final nota7 = _nota7Controller.value;
    final nota8 = _nota8Controller.value;
    final nota9 = _nota9Controller.value;

    print(">::::::");

    _stateController.add(LoginState.LOADING);

    bd.collection("monografia").add({
      "titulo": titulo,
      "nota1":nota1,
      "nota2":nota2,
      "nota3":nota3,
      "nota4":nota4,
      "nota5":nota5,
      "nota6":nota6,
      "nota7":nota7,
      "nota8":nota8,
      "nota9":nota9,
    }).catchError((e){
      _stateController.add(LoginState.FAIL);

    });

  }

  void logout() async {
    _stateController.add(LoginState.LOADING);
    await _auth.signOut();
    _stateController.add(LoginState.IDLE);
  }
  @override
  void dispose() {
    _tituloController.close();
    _nota1Controller.close();
    _nota2Controller.close();
    _nota3Controller.close();
    _nota4Controller.close();
    _nota5Controller.close();
    _nota6Controller.close();
    _nota7Controller.close();
    _nota8Controller.close();
    _nota9Controller.close();
    _stateController.close();
    _streamSubscription.cancel();
  }
}
