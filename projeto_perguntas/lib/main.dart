
import 'package:flutter/material.dart';

main() =>  runApp(PerguntaApp());


class PerguntaApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final perguntas = [
      "Texto qualquer",
      "Outro texto aqui",
      "pergunta aqui?"
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas!"),
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas[2]),
            RaisedButton(
              child: Text("Referência 1"),
              onPressed: null,
            ),
            RaisedButton(
              child: Text("Referência 2"),
              onPressed: null,
            ),
            RaisedButton(
              child: Text("Referência 3"),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}