import 'package:flutter/material.dart';
import 'package:tarea13/constantes.dart';
import 'package:tarea13/tarjeta_reusable.dart';
import 'calcular_resultado.dart';


class PaginaResultados extends StatelessWidget {
PaginaResultados({required this.imcResultado, required this.textoResultado, required this.textoInterpretado});
  final String imcResultado;
  final String textoResultado;
  final String textoInterpretado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('calculadora imc'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Text('El resultado es:', style: kTituloTextStyle,)
          ),
          Expanded(
            flex: 5,
              child: TarjetaReusable(
                alpresionar: (){},
                  colorido: kColorActivo,
                tarjetaChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(textoResultado, style: kResultadoText,),
                    Text(imcResultado, style: kIMCTextStyle),
                    Text(textoInterpretado, style: kBodyTextStyle),
                  ],
                ),
              ),
          )
        ],
      ),
    );
  }
}
