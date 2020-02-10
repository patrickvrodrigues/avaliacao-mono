import 'package:avaliacaomono/bd/avaliacao_bd.dart';
import 'package:avaliacaomono/widgets/input_field.dart';
import 'package:avaliacaomono/widgets/text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Avaliacao extends StatelessWidget {
  bool existe = false;
  DocumentSnapshot snapshot;
  String uid;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _nota1Controller = TextEditingController();
  TextEditingController _nota2Controller = TextEditingController();
  TextEditingController _nota3Controller = TextEditingController();
  TextEditingController _nota4Controller = TextEditingController();
  TextEditingController _nota5Controller = TextEditingController();
  TextEditingController _nota6Controller = TextEditingController();
  TextEditingController _nota7Controller = TextEditingController();
  TextEditingController _nota8Controller = TextEditingController();
  TextEditingController _nota9Controller = TextEditingController();
  TextEditingController _nota10Controller = TextEditingController();
  Avaliacao(this.snapshot, this.uid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Divider(),
                Center(child: Column(children: <Widget>[
                  Text('   Aluno: '+snapshot.data['nome'],style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),),
                  Text('   Orientador: '+snapshot.data['orientador'],style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),),
                ],),),

              Divider(),
                  Center(
                    child: TextFormFieldCustom(_tituloController,'titulo')
                  ),

                  Divider(),
                  Center(
                    child: Text('Trabalho Escrito',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                  Divider(),
                  Text('1 - Forma e correção gramatical de apresentação do trabalho. (Max 1 pt)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Text('2 - Clareza; Linguagem científica adequada; uso correto da terminologia. (Max 1 pt)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Text('3 - Adequações aos aspectos formais e às normas da ABNT. (Max 1 pt)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child:SizedBox(
                          width: 100.0,
                          child: TextFormFieldCustomNumber(_nota1Controller,'nota','1a','0 a 1'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SizedBox(
                          width: 100.0,
                          child: TextFormFieldCustomNumber(_nota2Controller,'nota','2a', '0 a 1'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SizedBox(
                          width: 100.0,
                          child: TextFormFieldCustomNumber(_nota3Controller,'nota','3a','0 a 1'),
                        ),
                      ),

                    ],
                  ),
                  Divider(),
                  Center(
                    child: Text('Conhecimento Cientifico',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                  Divider(),
                  Text('1 - Contribuição para a área, atualidade do tema e da revisão bibliográfica. (Max 1.5 pt)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Text('2 - Coerência dos objetivos iniciais do trabalho com as conclusões. (Max 1 pt)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Text('3 - Clareza na apresentação dos resultados, discussões e conclusões. (Max 1.5 pt)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child:SizedBox(
                          width: 100.0,
                          child: TextFormFieldCustomNumber(_nota4Controller,'nota','1a','0 a 1.5'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SizedBox(
                          width: 100.0,
                          child: TextFormFieldCustomNumber(_nota5Controller,'nota','2a','0 a 1'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SizedBox(
                          width: 100.0,
                          child: TextFormFieldCustomNumber(_nota6Controller,'nota','3a','0 a 1.5'),
                        ),
                      ),

                    ],
                  ),
                  Center(
                    child: Text('Apresentação Oral',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                  Divider(),
                  Text('1 - Conteúdo e forma da apresentação oral (uso e adequação do material audivisual). (Max 0.5 pt)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Text('2 - Domínio do assunto, segurança na exposição. (Max 1 pt)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Text('3 - Respeito ao tempo de apresentação. (Max 1 pt)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Text('4 - Desempenho na arguição. (Max 0.5 pt)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child:SizedBox(
                          width: 80.0,
                          child: TextFormFieldCustomNumber(_nota7Controller,'nota','1a','0 a 0.5'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SizedBox(
                          width: 80.0,
                          child: TextFormFieldCustomNumber(_nota8Controller,'nota','2a','0 a 1'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SizedBox(
                          width: 80.0,
                          child: TextFormFieldCustomNumber(_nota9Controller,'nota','3a','0 a 1'),
                        ),
                      ),                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SizedBox(
                          width: 80.0,
                          child: TextFormFieldCustomNumber(_nota10Controller,'nota','4a','0 a 0.5'),
                        ),
                      ),

                    ],
                  ),





                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () async {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            print(_formKey);
                            print(_formKey.currentState.toString());
                            cadastrar();
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Salvar'),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> cadastrar() async{

    var snapshott = await Firestore.instance.collection('monografia').getDocuments();
    DocumentSnapshot docReff ;
    print("foi");
    for(var snap in snapshott.documents){
        print(snap.data['alunoId']);
        print(snapshot.documentID);
        print("----------");
      if(snap.data['alunoId']== snapshot.documentID){
        existe=true;
         docReff= snap;
      }

    }

      double nota1;
      double nota2;
      double nota3;
      nota1 = double.parse(_nota1Controller.text)+double.parse(_nota2Controller.text)+double.parse(_nota3Controller.text);
      nota2 = double.parse(_nota4Controller.text)+double.parse(_nota5Controller.text)+double.parse(_nota6Controller.text);
      nota3 = double.parse(_nota7Controller.text)+double.parse(_nota8Controller.text)+double.parse(_nota9Controller.text)+double.parse(_nota10Controller.text);
      Query monografia = Firestore.instance.collection('monografia').where('alunoId',isEqualTo: snapshot.documentID).reference();
      if(existe==true){
        print("mononafria ja existe");
        docReff.reference.setData(
        {
        "avaliacoes": {

          uid: {
            "professorId": uid,
            "nota1": _nota1Controller.text,
            "nota2": _nota2Controller.text,
            "nota3": _nota3Controller.text,
            "nota4": _nota4Controller.text,
            "nota5": _nota5Controller.text,
            "nota6": _nota6Controller.text,
            "nota7": _nota7Controller.text,
            "nota8": _nota8Controller.text,
            "nota9": _nota9Controller.text,
            "total1": nota1,
            "total2": nota2,
            "total3": nota3,
          }
        },
        },merge: true
        );
      }else{
        var docRef =await Firestore.instance.collection("monografia").add({
          "titulo": _tituloController.text,
          "alunoId": snapshot.documentID,
          "nomeAluno": snapshot.data['nome'],
          "cursoAluno": snapshot.data['curso'],
          "periodoAluno": snapshot.data['periodo'],
          "professores": FieldValue.arrayUnion([uid]),
          "avaliacoes": {
            uid: {
              "professorId": uid,
              "nota1": _nota1Controller.text,
              "nota2": _nota2Controller.text,
              "nota3": _nota3Controller.text,
              "nota4": _nota4Controller.text,
              "nota5": _nota5Controller.text,
              "nota6": _nota6Controller.text,
              "nota7": _nota7Controller.text,
              "nota8": _nota8Controller.text,
              "nota9": _nota9Controller.text,
              "total1": nota1,
              "total2": nota2,
              "total3": nota3,
            }
          },

        });
      }



      Firestore.instance.collection('aluno').document(snapshot.documentID).updateData({"professores."+uid:true });


  }
}
