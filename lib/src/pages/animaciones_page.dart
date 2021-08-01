import 'package:flutter/material.dart';

import 'dart:math' as Math;

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

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{
  AnimationController ? controller;
  Animation<double> ? rotacion;
  Animation<double> ? opacidad;
  Animation<double> ? opacidadOut;
  Animation<double> ? moverDerecha;
  Animation<double> ? agrandar;
  
  @override
  void initState() {
    controller = new  AnimationController(vsync: this, duration: Duration(milliseconds: 4000));
    
    rotacion = Tween(begin: 0.0, end: 2 * Math.pi ).animate(
      CurvedAnimation(
          parent: controller as Animation<double>,
          curve:Curves.easeOut
      )
    );

    opacidad = Tween(begin: 0.1, end: 1.0).animate(
        CurvedAnimation(
            parent: controller as Animation<double>,
            curve:Interval(0.0,0.25, curve: Curves.easeOut)
        )
    );

    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(
        CurvedAnimation(
            parent: controller as Animation<double>,
            curve: Curves.easeOut
        )
    );

    agrandar = Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(
            parent: controller as Animation<double>,
            curve: Curves.easeOut
        )
    );
    
    opacidadOut = Tween(begin: 1.0, end:0.0 ).animate(
        CurvedAnimation(
            parent: controller as Animation<double>,
            curve: Interval(0,0.75)
        )
    );

    controller?.addListener(() {
      if(controller?.status == AnimationStatus.completed){
        controller?.reset();
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    controller?.forward();

    return AnimatedBuilder(
        animation:Listenable.merge([controller]) ,
        child:  _Rectagulo(),
        builder: (context, childRectangulo){
          return Transform.translate(
            offset: Offset(moverDerecha!.value, 0),
            child: Transform.rotate(
              angle:  rotacion!.value,
                child:Opacity(
                     opacity: opacidad!.value,
                    child: Transform.scale(
                        scale: agrandar!.value,
                        child: childRectangulo
                    )
                )
            ),
          );
        }
    );
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

