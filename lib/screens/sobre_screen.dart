import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  TextStyle estilo = TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Center(child: Text("Olá seja bem vindo ao SAM (Sistema de Avaliação de Monografia). "
                "Nosso sistema foi criado com a finalidade de substituir a tradicional papelada de preenchimento da monografia. "
                "\nAtualmente, nosso aplicativo se encontra em uma versão de teste. Nele é possivel"
                " Realizar as avaliações dos alunos associados aos professores e gerenciar elas.",style: estilo,),),
            Divider(),
            Center(
              child: Column(
                children: <Widget>[
                  Text("Desenvolvedor:",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  Divider(),
                  Text("Patrick Viegas Rodrigues",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  Divider(),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: Image.asset("assets/images/patrick.jpeg").image,
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
