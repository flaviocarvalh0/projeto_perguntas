import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual o nome do ator que faz o papel do homem de ferro?',
      'respostas': [
        {'texto': 'Chris Pratt', 'pontuacao': 0},
        {'texto': 'Adam Sendler', 'pontuacao': 0},
        {'texto': 'Robert D. Junior', 'pontuacao': 1},
        {'texto': 'Nicolas Cage', 'pontuacao': 0}
      ],
    },
    {
      'texto':
          'Qual o nome do martelo que Thor forja em Vingadores Guerra Infinita?',
      'respostas': [
        {'texto': 'Mjölnir', 'pontuacao': 0},
        {'texto': 'Luis', 'pontuacao': 0},
        {'texto': 'Stormbreaker', 'pontuacao': 1},
        {'texto': 'Manopla', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual o melhor Homem-Aranha?',
      'respostas': [
        {'texto': 'Andrew Garfield', 'pontuacao': 0},
        {'texto': 'Tobbey Maguire', 'pontuacao': 1},
        {'texto': 'Tom Holland', 'pontuacao': 0},
        {'texto': 'Mile Morelles', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual o nome do Guaxinim a aparece em Guerra Infinita?',
      'respostas': [
        {'texto': 'Dobby', 'pontuacao': 0},
        {'texto': 'Sergio', 'pontuacao': 0},
        {'texto': 'Rocket', 'pontuacao': 1},
        {'texto': 'Silas', 'pontuacao': 0}
      ],
    },
    {
      'texto': 'Loki é conhecido por ser o deus ...',
      'respostas': [
        {'texto': 'da Mentira', 'pontuacao': 1},
        {'texto': 'do Medo', 'pontuacao': 0},
        {'texto': 'da Morte', 'pontuacao': 0},
        {'texto': 'da Sabedoria', 'pontuacao': 0}
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _proximaPergunta() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  void _perguntaAnterior() {
    if (temPerguntaSelecionadaMenor) {
      setState(() {
        _perguntaSelecionada--;
      });
    }
  }

  void _reinciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  bool get temPerguntaSelecionadaMenor {
    return _perguntaSelecionada > 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
                proximaPergunta: _proximaPergunta,
                perguntaAnterior: _perguntaAnterior,
              )
            : Resultado(
                _pontuacaoTotal,
                _reinciarQuestionario,
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
