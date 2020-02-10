import 'package:avaliacaomono/blocs/login_bloc.dart';
import 'package:avaliacaomono/screens/lista_avaliacao_screen.dart';
import 'package:avaliacaomono/screens/login_screen.dart';
import 'package:avaliacaomono/screens/sobre_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'alunos_screen.dart';


class Home extends StatelessWidget {
  LoginBloc _loginBloc;
  String uid;

  Home(this._loginBloc, this.uid);
  BoxDecoration _boxDecoration1 = new BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.all(Radius.circular(20.0)));
  BoxDecoration _boxDecoration2 = new BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.all(Radius.circular(20.0)));
  TextStyle _estilo_texto_botao = TextStyle(
    fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    print("sdsadasasd");
    print(uid);
    return StreamBuilder(
      stream: Firestore.instance.collection("professores").document(uid).snapshots(),
      builder: (context,snapshot){
        if(!snapshot.hasData)return CircularProgressIndicator();
        return Scaffold(
            appBar: AppBar(
              title: Text("Avaliação"),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
                child: Center(child:
                Column(
                  children: <Widget>[
                    Image.asset('assets/images/sam.png'),
                    Divider(),
                    Text("Bem Vindo "+snapshot.data['nome'],style: TextStyle(fontSize: 20),),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Alunos(uid)),
                          );
                        },
                        child: Container(

                          width: 300,
                          height: 70,
                          decoration: _boxDecoration2,
                          child: Center(child:
                          Text("Alunos", style: _estilo_texto_botao,)),

                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListaAvaliacao(uid)),
                          );
                        },
                        child: Container(

                          width: 300,
                          height: 70,
                          decoration: _boxDecoration2,
                          child: Center(child:
                          Text("Minhas Avaliações", style: _estilo_texto_botao,)),

                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: (){
                          _loginBloc.logout();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context)=>LoginScreen())
                          );
                        },
                        child: Container(

                          width: 300,
                          height: 70,
                          decoration: _boxDecoration1,
                          child: Center(child:
                          Text("Deslogar", style: _estilo_texto_botao,)),

                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: (){
                          _loginBloc.logout();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context)=>Sobre())
                          );
                        },
                        child: Container(

                          width: 300,
                          height: 70,
                          decoration: _boxDecoration2,
                          child: Center(child:
                          Text("Sobre", style: _estilo_texto_botao,)),

                        ),
                      ),
                    ),
                  ],
                ),)
            )
        );
      },
    );
  }
  Future<void> getUid() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    String uid = user.uid;
    return uid;
  }
}
