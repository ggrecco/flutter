//inferencia em dart
main() {
  var soma = (x, y) {
    return x + y;
  };
  print(soma(1, 1));

//Semelhante a
  int Function(int, int) soma1 = (x, y) {
    return x + y;
  };
  print(soma1(1, 10));
}
