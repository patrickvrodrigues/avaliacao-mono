import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:avaliacaomono/blocs/login_bloc.dart';
import 'package:avaliacaomono/widgets/input_field.dart';

import 'home_screen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _loginBloc = LoginBloc();


  @override
  void initState()  {
    super.initState();

    var auth = FirebaseAuth.instance;
    var userr = auth.currentUser();

    _loginBloc.outState.listen((state){
      switch(state){
        case LoginState.SUCCESS:
          String uid;
          final Future<Null> user = auth.currentUser().then((FirebaseUser user) {
            final userid = user.uid;
            uid = userid;
          });
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context)=>Home(_loginBloc,uid))
          );
          break;
        case LoginState.FAIL:
          showDialog(context: context,builder: (context)=>AlertDialog(
            title: Text("Erro"),
            content: Text("Email ou Senha incorreta"),
          ));
          break;
        case LoginState.LOADING:
        case LoginState.IDLE:

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder<LoginState>(
          stream: _loginBloc.outState,
          initialData: LoginState.LOADING,
          builder: (context, snapshot) {
            print(snapshot.data);
            switch(snapshot.data){
              case LoginState.LOADING:
                return Center(child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Color.fromRGBO(255, 144, 82, 1.0)),
                ),);
              case LoginState.FAIL:
              case LoginState.SUCCESS:
              case LoginState.IDLE:

                return Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                    ),
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Image.asset('assets/images/sammini.png', height: 180,),
                            InputField(
                              icon: Icons.person_outline,
                              hint: "Usuário",
                              obscure: false,
                              stream: _loginBloc.outEmail,
                              onChanged: _loginBloc.changeEmail,
                            ),
                            InputField(
                              icon: Icons.lock_outline,
                              hint: "Senha",
                              obscure: true,
                              stream: _loginBloc.outPassword,
                              onChanged: _loginBloc.changePassword,
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            StreamBuilder<bool>(
                                stream: _loginBloc.outSubmitValid,
                                builder: (context, snapshot) {
                                  return SizedBox(
                                    height: 50,
                                    child: RaisedButton(
                                      color: Colors.green,
                                      child: Text("Entrar",style: TextStyle(fontSize: 20),),
                                      onPressed: snapshot.hasData ? _loginBloc.submit : null,
                                      textColor: Colors.white,
                                      disabledColor: Colors.green.withOpacity(0.8),

                                    ),
                                  );
                                }
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
            }
            return null;
          }
      ),

    );
  }
}