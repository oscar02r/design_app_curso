import 'package:design_app_curso/src/pages/animaciones_page.dart';
import 'package:design_app_curso/src/pages/headers_page.dart';
import 'package:design_app_curso/src/retos/cuadrado_animado.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CuadradoAnimadoPage (),
    );
  }
}

