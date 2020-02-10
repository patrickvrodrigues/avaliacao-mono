import 'dart:async';

class AvaliacaoValidators {
  final validateTitulo = StreamTransformer<String,String>.fromHandlers(
      handleData: (titulo, sink){
        if(titulo.isNotEmpty){
          sink.add(titulo);
        }else{
          sink.addError("Insira um titulo");
        }
      }
  );

  final validateNota1 = StreamTransformer<String,String>.fromHandlers(
      handleData: (nota1, sink){
        if(nota1.isEmpty){
          sink.add(nota1);
        }else{
          sink.addError("Insira uma nota");
        }
      }
  );
  final validateNota2 = StreamTransformer<String,String>.fromHandlers(
      handleData: (nota2, sink){
        if(nota2.isEmpty){
          sink.add(nota2);
        }else{
          sink.addError("Insira uma nota");
        }
      }
  );
  final validateNota3 = StreamTransformer<String,String>.fromHandlers(
      handleData: (nota3, sink){
        if(nota3.isEmpty){
          sink.add(nota3);
        }else{
          sink.addError("Insira uma nota");
        }
      }
  );
  final validateNota4 = StreamTransformer<String,String>.fromHandlers(
      handleData: (nota4, sink){
        if(nota4.isEmpty){
          sink.add(nota4);
        }else{
          sink.addError("Insira uma nota");
        }
      }
  );
  final validateNota5 = StreamTransformer<String,String>.fromHandlers(
      handleData: (nota5, sink){
        if(nota5.isEmpty){
          sink.add(nota5);
        }else{
          sink.addError("Insira uma nota");
        }
      }
  );
  final validateNota6 = StreamTransformer<String,String>.fromHandlers(
      handleData: (nota6, sink){
        if(nota6.isEmpty){
          sink.add(nota6);
        }else{
          sink.addError("Insira uma nota");
        }
      }
  );
  final validateNota7 = StreamTransformer<String,String>.fromHandlers(
      handleData: (nota7, sink){
        if(nota7.isEmpty){
          sink.add(nota7);
        }else{
          sink.addError("Insira uma nota");
        }
      }
  );
  final validateNota8 = StreamTransformer<String,String>.fromHandlers(
      handleData: (nota8, sink){
        if(nota8.isEmpty){
          sink.add(nota8);
        }else{
          sink.addError("Insira uma nota");
        }
      }
  );
  final validateNota9 = StreamTransformer<String,String>.fromHandlers(
      handleData: (nota9, sink){
        if(nota9.isEmpty){
          sink.add(nota9);
        }else{
          sink.addError("Insira uma nota");
        }
      }
  );
}