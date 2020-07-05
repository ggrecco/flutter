import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List perguntas;
  final int perguntaSelecionada;
  final List respostas;
  final void Function() responder;

  Questionario(
      this.perguntas, this.perguntaSelecionada, this.respostas, this.responder);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto']),
        ...respostas.map((t) => Resposta(t, responder)).toList(),
      ],
    );
  }
}
