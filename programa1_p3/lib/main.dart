import 'package:flutter/material.dart';
import 'package:programa1_p3/widget/MostrarDatos.dart';
import 'package:programa1_p3/widget/basedatos.dart';
import 'package:programa1_p3/widget/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Basedatos(),
    );
  }
}
