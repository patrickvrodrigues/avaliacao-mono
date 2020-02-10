import 'package:avaliacaomono/screens/avaliacao_detalhes_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class ListaAvaliacao extends StatefulWidget {
  String uid;
  ListaAvaliacao(this.uid);
  @override
  _ListaAvaliacaoState createState() => _ListaAvaliacaoState(uid);
}

class _ListaAvaliacaoState extends State<ListaAvaliacao> {
  String uid;
  var documentId;
  _ListaAvaliacaoState(this.uid);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Avaliações"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('monografia').where('professores', arrayContains: uid).snapshots(),
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
                              color: Colors.green.withOpacity(0.1),
                              border: Border.all(color: Colors.green.withOpacity(0.5)),
                            ),

                            child: ListTile(
                              contentPadding: EdgeInsets.only(left: 5, right: 0, top: 10,bottom: 10),
                              title: Text("Aluno: "+documents[index].data['nomeAluno']),
                              subtitle: Text('Curso: '+documents[index].data['cursoAluno'] + " "+ documents[index].data['periodoAluno']+"º periodo\nTítulo: "+documents[index].data['titulo'] ),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AvaliacaoDetalhes(documents[index],uid)),
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