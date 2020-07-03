import 'package:flutter/material.dart';
import './questao.dart';

main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  void responder() {
    setState(() {
      perguntaSelecionada++;
    });
    
    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = ["Texto qualquer", "Outro texto aqui", "pergunta aqui?"];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas!"),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[perguntaSelecionada]),
            RaisedButton(
              child: Text("Referência 1"),
              onPressed: responder,
            ),
            RaisedButton(
              child: Text("Referência 2"),
              onPressed: responder,
            ),
            RaisedButton(
              child: Text("Referência 3"),
              onPressed: () => responder(),
            ),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
