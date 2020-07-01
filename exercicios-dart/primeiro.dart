//inferencia em dart
main() {
  var soma = ([x = 1, y = 1]) {
    return x + y;
  };
  print(soma());

//Semelhante a
  int Function(int, int) soma1 = (x, y) {
    return x + y;
  };
  print(soma1(1, 10));

//Função arrow
  var soma2 = (int a, int b) => a + b;
  print(soma2(10, 10));
}
