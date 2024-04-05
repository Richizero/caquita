import 'dart:math';

class CalcularResultado {
  CalcularResultado({required this.alturas, required this.pesos});

  final int alturas;
  final int pesos;
  double _imc = 0.0;

  String calcularIMC() {
    _imc = pesos / pow(alturas / 100, 2);
    return _imc.toStringAsFixed(1);
  }

  String getResultado() {
    if (_imc >= 30.0) {
      return 'obesidad';
    } else if (_imc >= 25.0) {
      return 'sobrepeso';
    } else if (_imc >= 18.5) {
      return 'normal';
    } else {
      return 'bajo peso';
    }
  }


  String getInterpretado() {
    if (_imc >= 30.0) {
      return 'tiene un peso alto, requiere consultar a un especialista';
    } else if (_imc >= 25.0) {
      return 'tiene un peso mayor que el normal, intente hacer mas ejercicio';
    } else if (_imc >= 18.5) {
      return 'tiene un peso normal, buen trabajo';
    } else {
      return 'tiene un peso menor, debe alimentarse mejor';
    }
  }
}
