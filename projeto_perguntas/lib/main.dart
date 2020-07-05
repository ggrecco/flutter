import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Pergunta 1',
      'resposta': [
        {'texto': 'resposta1', 'pontuacao': 1},
        {'texto': 'resposta2', 'pontuacao': 2},
        {'texto': 'resposta3', 'pontuacao': 3},
        {'texto': 'resposta4', 'pontuacao': 4},
      ],
    },
    {
      'texto': 'Pergunta 2',
      'resposta': [
        {'texto': 'resposta1', 'pontuacao': 1},
        {'texto': 'resposta2', 'pontuacao': 2},
        {'texto': 'resposta3', 'pontuacao': 3},
        {'texto': 'resposta4', 'pontuacao': 4},
      ],
    },
    {
      'texto': 'Pergunta 3',
      'resposta': [
        {'texto': 'resposta1', 'pontuacao': 1},
        {'texto': 'resposta2', 'pontuacao': 2},
        {'texto': 'resposta3', 'pontuacao': 3},
        {'texto': 'resposta4', 'pontuacao': 4},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas!"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(
              pontuacao: _pontuacaoTotal,
              quandoReiniciarQuestionario: _reiniciar,),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
