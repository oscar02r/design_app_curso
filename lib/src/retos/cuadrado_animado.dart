import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadrodoAnimado(),
      ) ,
    );
  }
}


class  CuadrodoAnimado extends StatefulWidget {

  @override
  _CuadrodoAnimadoState createState() => _CuadrodoAnimadoState();
}

class _CuadrodoAnimadoState extends State<CuadrodoAnimado>  with SingleTickerProviderStateMixin {
  AnimationController ? controller;
  Animation<double>? moverDerecha;
  Animation<double>? moverArriba;
  Animation<double>? moverIzquierda;
  Animation<double>? moverAbajo;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 4500));
     controller?.addListener(() {
           if(controller?.status == AnimationStatus.completed){
           //  controller!.repeat();
           }
     });

     moverDerecha = Tween(begin: 0.0, end: 100.0).animate(
       CurvedAnimation(parent: controller as Animation<double>,
           curve: Interval(0.0, 0.25, curve: Curves.bounceOut))
     );
    moverArriba = Tween(begin: 0.0, end: - 100.0).animate(
        CurvedAnimation(parent: controller as Animation<double>,
            curve: Interval(0.25, 0.5, curve: Curves.bounceOut))
    );
    moverIzquierda = Tween(begin: 0.0, end: - 100.0).animate(
        CurvedAnimation(parent: controller as Animation<double>,
            curve: Interval(0.5, 0.75, curve: Curves.bounceOut))
    );
    moverAbajo = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(parent: controller as Animation<double>,
            curve: Interval(0.75, 1.0, curve: Curves.bounceOut))
    );
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
      animation: Listenable.merge([controller]),
        child: _Rectagulo(),
        builder: (context,  child){
        return Transform.translate(
            offset: Offset(moverDerecha!.value + moverIzquierda!.value,moverArriba!.value + moverAbajo!.value),
          child: child,
        );
    },
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