import 'dart:math';

import 'package:flutter/material.dart';

class CirculaProgressPage extends StatefulWidget {
  const CirculaProgressPage({Key? key}) : super(key: key);

  @override
  _CirculaProgressPageState createState() => _CirculaProgressPageState();
}

class _CirculaProgressPageState extends State<CirculaProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          height: 300.0,
          width: 300.0,
          child: CustomPaint(
            painter: _MiRadialProgress(),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter{
  @override

  //Circulo
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
          ..strokeWidth = 4
          ..color = Colors.grey
          .. style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radio = min( size.width * 0.5, size.height * 0.5) ;
    canvas.drawCircle(center, radio, paint);

     //Arco
    final paintArco = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      .. style = PaintingStyle.stroke;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}
