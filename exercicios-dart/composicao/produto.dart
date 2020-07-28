class Produto {
  int codigo;
  String nome;
  double preco;
  double desconto;

  Produto({
    this.codigo,
    this.nome,
    this.desconto,
    this.preco
  });

  double get precoComDesconto{
    return (1 - desconto) * preco;
  }
}
