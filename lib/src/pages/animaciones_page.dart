import 'package:flutter/material.dart';

class AnimacionesPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado  extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> {
  @override
  Widget build(BuildContext context) {
    return _Rectagulo();
  }
}

class _Rectagulo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: 70.0,
      decoration: BoxDecoration(
        color: Colors.blue
      ),
    );
  }
}

