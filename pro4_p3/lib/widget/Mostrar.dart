import 'package:flutter/material.dart';
import 'package:pro4_p3/widget/Tareas.dart';

class Mostrar extends StatefulWidget {
  const Mostrar({super.key});

  @override
  State<StatefulWidget> createState() {
    return Clase2();
  }
}

class Clase2 extends State<Mostrar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Mostrar Tareas'),
      ),
    );
  }
}
