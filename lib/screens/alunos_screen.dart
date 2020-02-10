import 'package:avaliacaomono/blocs/avaliacao_bloc.dart';
import 'package:avaliacaomono/screens/avaliacao_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Alunos extends StatefulWidget {
  String uid;
  Alunos(this.uid);
  @override
  _AlunosState createState() => _AlunosState(uid);
}

class _AlunosState extends State<Alunos> {
  String uid;
  _AlunosState(this.uid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Alunos'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection("aluno").where('professores.'+uid,isEqualTo: false).snapshots(),
              builder: (context, snapshot){
                switch(snapshot.connectionState){
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    List<DocumentSnapshot> documents = snapshot.data.documents;

                    return ListView.builder(

                        itemCount: documents.length,
                        itemBuilder: (context,index){
                          return Container(
                            decoration: new BoxDecoration (
                              color: Colors.orangeAccent.withOpacity(0.1),
                              border: Border.all(color: Colors.green.withOpacity(0.5)),
                            ),

                            child: ListTile(
                              contentPadding: EdgeInsets.only(left: 5, right: 0, top: 10,bottom: 10),
                              title: Text(documents[index].data['nome']),
                              subtitle: Text('Curso: '+ documents[index].data['curso']+"              "+ documents[index].data['periodo']+ "º Periodo"),
                              leading: CircleAvatar(backgroundImage: NetworkImage("https://i.ya-webdesign.com/images/avatar-png-1.png")),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Avaliacao(documents[index],uid)),
                                );
                              },

                            ),
                          );
                        }
                    );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

