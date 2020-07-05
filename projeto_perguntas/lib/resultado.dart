import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado({this.pontuacao, this.quandoReiniciarQuestionario});

  String get texto {
    if (pontuacao < 5) {
      return 'Parabéns!!';
    } else if (pontuacao < 10) {
      return 'OK!';
    } else {
      return 'Jedi!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Text(
          texto,
          style: TextStyle(fontSize: 28),
        )),
        FlatButton(
          child: Text("Reiniciar?", style: TextStyle(fontSize: 18)),
          textColor: Colors.blue,
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
