import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  String _texto;
  TextEditingController _controller;
  TextFormFieldCustom(this._controller,this._texto);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10,right: 10),
      child: TextFormField(
        controller: _controller,
        decoration:InputDecoration(
          border: OutlineInputBorder(),
          hintText: _texto,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Por favor, Insira um'+_texto;
          }
          return null;
        },
      ),
    );
  }
}

class TextFormFieldCustomNumber extends StatelessWidget {
  String texto;
  String label;
  String aviso;
  TextEditingController _controller;
  TextFormFieldCustomNumber(this._controller,this.texto,this.label,this.aviso);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      expands: false,
      controller: _controller,
      decoration: InputDecoration(
        prefix: Text('=>'),
        labelText: label,
        labelStyle: TextStyle(),
        hintText: texto,
        alignLabelWithHint: true,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return aviso;
        }
        return null;
      },
      keyboardType: TextInputType.phone,
    );
  }
}
