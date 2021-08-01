import 'dart:math' as Math ;
import 'dart:ui';

import 'package:flutter/material.dart';

class CirculaProgressPage extends StatefulWidget {
  const CirculaProgressPage({Key? key}) : super(key: key);

  @override
  _CirculaProgressPageState createState() => _CirculaProgressPageState();
}

class _CirculaProgressPageState extends State<CirculaProgressPage>  with SingleTickerProviderStateMixin{
  double porcentaje = 0.0;
  double nuevoPorcentaje=0.0;
  AnimationController ? controller;
  @override
  void initState() {
    controller = new AnimationController(vsync: this, duration:Duration(milliseconds: 800 ));

    controller?.addListener(() {

      porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller!.value) as double;
      setState(() {});
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
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          height: 300.0,
          width: 300.0,
          child: CustomPaint(
            painter: _MiRadialProgress(porcentaje),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: (){
          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 10;
          if(porcentaje >100){
             porcentaje = 0;
             nuevoPorcentaje=0;

          }
          controller?.forward(from: 0.0);
          setState(() {});
        },
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter{
   final porcentaje;
  _MiRadialProgress(this.porcentaje);


  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
          ..strokeWidth = 4
          ..color = Colors.grey
          .. style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radio = Math.min( size.width * 0.5, size.height * 0.5) ;
    canvas.drawCircle(center, radio, paint);

     //Arco
    final paintArco = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      .. style = PaintingStyle.stroke;

   //Parte que llena el circulo
    double arcAngle = 2 * Math.pi *( porcentaje /100);
     canvas.drawArc(
         Rect.fromCircle(center: center, radius: radio),
         -Math.pi/2,
         arcAngle,
         false,
         paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}
