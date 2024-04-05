import 'package:flutter/material.dart';

class TarjetaReusable extends StatelessWidget {

  TarjetaReusable({required this.colorido, required this.tarjetaChild, required this.alpresionar});
  Color colorido;
  final Widget tarjetaChild;
  final VoidCallback alpresionar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: alpresionar,
      child: Container(
        child: tarjetaChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: colorido,
        ),
      ),
    );
  }
}
