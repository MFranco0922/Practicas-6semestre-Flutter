import 'package:flutter/material.dart';
import 'package:pro4_p3/widget/Agregar.dart';
import 'package:pro4_p3/widget/Mostrar.dart';

class Tareas extends StatefulWidget {
  const Tareas({super.key});

  @override
  State<StatefulWidget> createState() {
    return Clase();
  }
}

class Clase extends State<Tareas> {
  int seleccionarindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tareas',
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 252, 252),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: seleccionarindex == 0 ? Agregar() : Mostrar(),
      //
      //NAVIGATOR BARR
      //
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_work),
              //
              label: 'Agregar Tarea'),
          //
          BottomNavigationBarItem(
              icon: Icon(Icons.home_work),
              //
              label: 'Mostrar Tarea'),
        ],
        currentIndex: seleccionarindex,
        selectedItemColor: const Color.fromARGB(255, 223, 13, 13),
        onTap: (index) {
          setState(() {
            seleccionarindex = index;
          });
        },
      ),
    );
  }
}
