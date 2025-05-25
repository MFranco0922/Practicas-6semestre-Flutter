import 'package:flutter/material.dart';
import 'package:pro4_p3/widget/Tareas.dart';

class Agregar extends StatefulWidget {
  const Agregar({super.key});

  @override
  State<StatefulWidget> createState() {
    return Clase1();
  }
}

class Clase1 extends State<Agregar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Agregar Tareas'),
      ),
    );
  }
}