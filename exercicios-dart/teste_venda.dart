import 'composicao/produto.dart';
import 'composicao/venda.dart';
import 'composicao/cliente.dart';
import 'composicao/venda_item.dart';

main() {
  var item1 = VendaItem(
      quantidade: 30,
      produto: Produto(
        codigo: 1,
        nome: 'Lapis',
        preco: 6.00,
        desconto: 0.5,
      ));
  var venda = Venda(
    cliente: Cliente(nome: 'Teste', cpf: '123.456.789-00'),
    itens: <VendaItem>[
      item1,
      VendaItem(
          quantidade: 20,
          produto: Produto(
            codigo: 1,
            nome: 'Caderno',
            preco: 20.00,
            desconto: 0.25,
          )),
      VendaItem(
          quantidade: 100,
          produto: Produto(
            codigo: 52,
            nome: 'Borracha',
            preco: 2.00,
            desconto: 0.5,
          )),
    ],
  );

  print(venda.valorTotal);
  print(venda.itens[0].produto.nome);
}
