import 'package:cloud_firestore/cloud_firestore.dart';

class AvaliacaoBD {
  final db = Firestore.instance;
  bool existe = false;

  void createData() async {
    //var snapshot = await db.collection('CRUD').getDocuments();


      await db.collection('monografia').add({
        "nome": "nome",
      });



  }


}