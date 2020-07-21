class Data {
  int dia = 0;
  int mes = 0;
  int ano = 0;

  dataFormatada(){
     print('${dia}/${mes}/${ano}');
  }
}

main() {
  var dataAniversario = new Data();

  dataAniversario.dia = 3;
  dataAniversario.mes = 12;
  dataAniversario.ano = 2020;

  Data compra = Data();

  print('${dataAniversario.dia}/' +
      '${dataAniversario.mes}/' +
      '${dataAniversario.ano}');

  compra.dataFormatada();
}
