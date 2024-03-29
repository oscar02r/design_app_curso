import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderCuadradoRedondeados extends StatelessWidget {
  const HeaderCuadradoRedondeados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      decoration: BoxDecoration(

          color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(65.0),
          bottomRight: Radius.circular(65.0)
        )
      ),

    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter() ,
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
     final paint = Paint();
     //Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth =2.0;

    //Puntos a Dibujar con el lapiz.
    final path = Path();
    path.moveTo( 0 , size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

   //Dibujar path en pantallta
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

   return true;
  }

}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter() ,
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth =10.0;

    //Puntos a Dibujar con el lapiz.
    final path = Path();
   // path.moveTo( 0 , size.height * 0.35);
    path.lineTo(size.width, size.height );
    path.lineTo(0, size.height);
   // path.lineTo(0, 0);

    //Dibujar path en pantallta
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }

}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter() ,
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth =2.0;

    //Puntos a Dibujar con el lapiz.
    final path = Path();
    path.moveTo( 0 , size.height * 0.30);
    path.lineTo(size.width * 0.5 , size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    //Dibujar path en pantallta
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }

}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter() ,
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth =20.0;

    //Puntos a Dibujar con el lapiz.
    final path = Path();
    path.lineTo( 0 , size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.50, size.height * 0.40, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    //Dibujar path en pantallta
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }

}

class HeaderWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter () ,
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth =20.0;

    //Puntos a Dibujar con el lapiz.
    final path = Path();
    // path.lineTo( 0 , size.height * 0.25);
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.20,  size.width , size.height * 0.25);
    // path.lineTo(size.width, 0);
    // //Dibujar path en pantallta
    // canvas.drawPath(path, paint);
   //Wave abajo
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.25, size.height *0.80 , size.width * 0.5, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.70 , size.width, size.height * 0.75);
    path.lineTo(size.width, size.height );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }

}

class HeaderWaveGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter () ,
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(
        center: Offset(0.0,55.0),
        radius: 180.0
    );
    final Gradient gradient = new LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff6D05E8),
          Color(0xffC012FF),
          Color(0xff6D05FA),
        ],
      stops: [
        0.4,
        0.9,
        1.0
      ]
    );
    final paint = Paint()..shader = gradient.createShader(rect);
    //Propiedades

    paint.style = PaintingStyle.fill;
    paint.strokeWidth =20.0;

    //Puntos a Dibujar con el lapiz.
    final path = Path();
    path.lineTo( 0 , size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20,  size.width , size.height * 0.25);
    path.lineTo(size.width, 0);
    //Dibujar path en pantallta arriba
    canvas.drawPath(path, paint);

    //Wave abajo
    // path.moveTo(0, size.height);
    // path.lineTo(0, size.height * 0.75);
    // path.quadraticBezierTo(size.width * 0.25, size.height *0.80 , size.width * 0.5, size.height * 0.75);
    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.70 , size.width, size.height * 0.75);
    // path.lineTo(size.width, size.height );
    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }

}