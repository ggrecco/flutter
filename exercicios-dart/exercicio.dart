
int exec(int a, int b, int Function(int, int) fn){
  return fn(a,b);
}

class Produto {
  double preco;
  String nome;
  
  // Produto(String nome, double preco){
  //   this.nome = nome;
  //   this.preco = preco;
  // }
  // Produto(this.nome, this.preco);
  
  Produto({this.nome, this.preco}); // chaves indica que é nominal
}

main(){
  int a = 3;
  double b = 1.1;
  bool isVerdadeiro = true;
  dynamic x = "teste";
  x = 1;
  x = false;
  print("Olá mundo");
  print(a);
  print(b);
  print(isVerdadeiro);
  print(a + b);

  var nomes = ["Eu", "Tu", "Ele"];
  nomes.add("Nos");
  nomes.add("Vós");
  nomes.add("Eles");

  print(nomes);
  print(nomes[0]);
  print(nomes.elementAt(1));
  print(nomes.elementAt(2));
  print(nomes[5]);

  Map<String, double> notasDosAlunos = {
    "Eu":10,
    "Tu": 9.4,
    };

  for(var i in notasDosAlunos.values){
    print('chave = $i');
  }

  print("chave  =  valor de notasDosAlunos");
  for(var obj in notasDosAlunos.entries){
    print('${obj.key} = ${obj.value}');
  }


  var notasDosAlunos2 = {"teste":123};
  print(notasDosAlunos2);
  for(var obj in notasDosAlunos2.entries){
    print('${obj.key} = ${obj.value}');
  }

final r = exec(2, 3, (a, b) => a + b );
print(r);

var p1 = new Produto(nome:"Caneta", preco:1.80);
var p2 = Produto(preco: 0.70, nome: "Lapis");

print("O produto ${p1.nome} custa R\$ ${p1.preco}");
print("O produto ${p2.nome} custa R\$ ${p2.preco}");
}