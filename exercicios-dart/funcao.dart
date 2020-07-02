import 'dart:wasm';

int Function(int) somaParcial(int a) {
  return (int b) {
    return a + b;
  };
}

//generics
E qualSegundoElemento<E>(List<E> lista) {
  return lista.length >= 2 ? lista[1] : null;
}

var notas = [7.1, 8.1, 6.0, 5.4, 4.1, 9.9];
var notasBoas = (double nota) => nota >= 7;

var alunos = [
  {'nome': 'Alfredo', 'nota': 9.9},
  {'nome': 'Mariana', 'nota': 9.3},
  {'nome': 'Ana', 'nota': 8.7},
  {'nome': 'Ricardo', 'nota': 8.1},
  {'nome': 'Gustavo', 'nota': 7.6},
  {'nome': 'Wilson', 'nota': 6.8},
];

String Function(Map) pegarNomes = (aluno) => aluno['nome'];
// double Function(Map) pegarNotas = (aluno) => aluno['nota'];
int Function(String) numeroLetras = (texto) => texto.length;

// double somar(double a, double b) {
//   return a + b;
// }

var somaNotas = alunos
    .map((aluno) => aluno['nota'])
    .map((nota) => (nota as double))
    .reduce((a, b) => a + b);
    
main() {
  print(somaParcial(2)(10));
  var somaCom10 = somaParcial(10);
  print(somaCom10(2));

  var lista = [1, 210, 3, 41, 5, 1];
  print(qualSegundoElemento(lista));

  var aprovados = notas.where(notasBoas);
  print(aprovados);

  var nomes = alunos.map(pegarNomes);
  print(nomes);

  var qtoLetras = nomes.map(numeroLetras);
  print(qtoLetras);

  // var notasAlunos = alunos.map(pegarNotas);
  // print(notasAlunos);

  // var mediaTurma = notasAlunos.reduce(somar);
  // print(mediaTurma / notasAlunos.length);

  print(somaNotas / alunos.length);
}
