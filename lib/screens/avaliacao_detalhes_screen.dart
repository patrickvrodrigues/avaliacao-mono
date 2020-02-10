import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AvaliacaoDetalhes extends StatelessWidget {
  DocumentSnapshot snapshot;
  String uid;

  AvaliacaoDetalhes(this.snapshot,this.uid);

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Aluno: "),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Título: "),
              Text(snapshot.data['avaliacoes'][uid]['nota1']),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Título: "),
              Text(snapshot.data['titulo'])
            ],
          )
        ],
      ),
    );
  }
}
