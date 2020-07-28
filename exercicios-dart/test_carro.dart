import 'carro.dart';

main() {
  var carro = Carro(200);

  while (!carro.estaNoLimite()) {
    print(carro.acelerar());
    
  }
  while(!carro.estaParado()){
    print(carro.frear());
  }
}
