import 'package:flutter/material.dart';


// ignore: must_be_immutable
class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelection;

  Resposta(this.texto, this.onSelection);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: 
      ElevatedButton(
        //style: ElevatedButton.styleFrom(
        //primary: Colors.blue, // cor do botão
        //onPrimary: Colors.white, // cor do texto
        //),
        child: Text(texto),
        onPressed: onSelection,
      ),
      
    );
  }
}
