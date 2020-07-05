import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  void responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
      });
    }
  }

  final _perguntas = const [
    {
      'texto': 'Pergunta 1',
      'resposta': ['resposta1', 'resposta2', 'resposta3', 'resposta4'],
    },
    {
      'texto': 'Pergunta 2',
      'resposta': ['resposta1', 'resposta2', 'resposta3', 'resposta4'],
    },
    {
      'texto': 'Pergunta 3',
      'resposta': ['resposta1', 'resposta2', 'resposta3', 'resposta4'],
    },
  ];

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < _perguntas.length;
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
              perguntaSelecionada: perguntaSelecionada,
              responder:responder)
            : Resultado("Parabéns!!"),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
