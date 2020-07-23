class Data {
  int dia;
  int mes;
  int ano;

  Data({this.dia, this.mes, this.ano});

  dataFormatada() {
    print('${dia}/${mes}/${ano}');
  }
}

main() {
  var dataAniversario = new Data();

  dataAniversario.dia = 3;
  dataAniversario.mes = 12;
  dataAniversario.ano = 2020;

  Data compra = Data(dia: 0, ano: 0, mes: 0);

  print('${dataAniversario.dia}/' +
      '${dataAniversario.mes}/' +
      '${dataAniversario.ano}');

  compra.dataFormatada();
}
