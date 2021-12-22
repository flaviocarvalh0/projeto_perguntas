import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao == 0) {
      return 'Poxa Não acertou nenhuma.';
    } else if (pontuacao == 1) {
      return 'boa! Você acertou $pontuacao';
    } else if (pontuacao == 2) {
      return 'Você parece conhecer, acertou $pontuacao';
    } else if(pontuacao == 3){
      return 'Muito Bom! Acertou $pontuacao';
    } else{
      return 'Você é Geek! Acertou $pontuacao';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
          onPressed: quandoReiniciarQuestionario,
          child: Text('Reiniciar?', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
