import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tarea13/pagina_resultado.dart';
import 'icono_contenido.dart';
import 'tarjeta_reusable.dart';
import 'constantes.dart';
import 'pagina_resultado.dart';
import 'calcular_resultado.dart';

enum Genero {hombre, mujer}
class paginainicio extends StatefulWidget {
  const paginainicio({super.key});

  @override
  State<paginainicio> createState() => _paginainicioState();
}


class _paginainicioState extends State<paginainicio> {
  Color colorTarjetaMujer = kColorInactivo;
  Color colorTarjetaHombre = kColorInactivo;
  Genero generoElegido = Genero.mujer;
  int altura=173;
  int peso=60;
  int edad=25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('calculadora imc'),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Expanded(child: Row(
            children: [

              Expanded(child: TarjetaReusable(
                alpresionar: (){
                  setState(() {
                    generoElegido=Genero.hombre;
                  });
                },
                  colorido: generoElegido== Genero.hombre?kColorActivo:kColorInactivo,
                tarjetaChild: IconoContenido(icono: FontAwesomeIcons.mars, etiqueta:"Hombrecito",),
              )),
              Expanded(child: TarjetaReusable(
              alpresionar: () {
                setState(() {
                  generoElegido = Genero.mujer;
                });
              },
                colorido: generoElegido== Genero.mujer?kColorActivo:kColorInactivo,
              tarjetaChild: IconoContenido(icono:  FontAwesomeIcons.venus, etiqueta:"Mujercita",),
              )),
          ],
    )),
          Expanded(
              child: TarjetaReusable(
                alpresionar: (){},
                colorido: kColorActivo,
                tarjetaChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ALTURA', style: kEtiquetaTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(altura.toString(), style: kNumeroTextStyle),
                        Text('cm', style: kEtiquetaTextStyle,),
                      ],
                    ),
                    Slider(
                      value: altura.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8d8e98),
                      onChanged: (double nuevoValor){
                        setState(() {
                          altura=nuevoValor.round();
                        });
                      },
                    ),
                  ],
                ),
              )
          ),
          Expanded(child: Row(
            children: [
              Expanded(
                  child: TarjetaReusable(
                    alpresionar: (){},
                    colorido: kColorActivo,
                    tarjetaChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('PESO'),
                        Text(peso.toString(), style: kNumeroTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconoRedondo(iconito: FontAwesomeIcons.minus,
                            alPresionar: (){
                              setState(() {
                                peso--;
                              });
                            },
                            ),
                            SizedBox(width: 10.0,),
                            IconoRedondo(iconito: FontAwesomeIcons.plus,
                            alPresionar: (){
                              setState(() {
                                peso++;
                              });
                            },),
                          ],
                        ),
                      ],
                    ),
                  ),
              ),

              Expanded(child: TarjetaReusable(
              alpresionar: (){},
              colorido: kColorActivo,
              tarjetaChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('Edad'),
                  Text(edad.toString(), style: kNumeroTextStyle),
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                IconoRedondo(iconito: FontAwesomeIcons.minus,
                  alPresionar: (){
                    setState(() {
                    edad--;
                    });
                    },
                    ),
                    SizedBox(width: 10.0,),
                    IconoRedondo(iconito: FontAwesomeIcons.plus,
                    alPresionar: (){
                  setState(() {
                    edad++;
                    });
                    },
                    ),
                    ],
                    ),
                ],
    )
    )
              )
                    ],
                ),
                ),
            GestureDetector(
          onTap: (){
            CalcularResultado calc = CalcularResultado(alturas: altura, pesos: peso);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PaginaResultados(
    imcResultado: calc.calcularIMC(),
    textoResultado: calc.getResultado(),
    textoInterpretado: calc.getInterpretado(),
    )));

    },
    child: Container(
    child: Center(child:Text('CALCULAR', style: kBotonLargoTextStyle,)),
    color: kColorContenedorAbajo,
    margin: EdgeInsets.only(top: 10.0),
    width: double.infinity,
    height: kAlturaContenedorAbajo,
    ),
    ),
            ],
    ),
          );
  }
}



class IconoRedondo extends StatelessWidget {

  IconoRedondo({required this.iconito, required this.alPresionar});
  final IconData iconito;
  final VoidCallback alPresionar;

  @override

  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
        elevation: 6.0,
        onPressed:  alPresionar,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
