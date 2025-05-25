import 'package:flutter/material.dart';
import 'package:programa1_p3/basedatos/BD.dart';
import 'package:programa1_p3/widget/MostrarDatos.dart';

class Basedatos extends StatefulWidget {
  const Basedatos({super.key});

  @override
  State<StatefulWidget> createState() {
    return BaseDatos();
  }
}

class BaseDatos extends State<Basedatos> {
  final TextEditingController usuario = TextEditingController();
  final TextEditingController password = TextEditingController();

  void agregar() async {
    String u = usuario.text;
    String p = password.text;

    if (u.isNotEmpty && p.isNotEmpty) {
      await BD().insertarUsuario(u, p);
      usuario.clear();
      password.clear();

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Datos ingresados'),
              content: Text('Datos enviados correctamente'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Acpetar'),
                ),
              ],
            );
          });
    } else {
      //MOSTRAR ALERTA

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Datos ingresados'),
              content: Text('Usuario: $u \n Password; $p'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Aceptar'),
                ),
              ],
            );
          });
      //fin alerta
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Practica Bases de Datos"),
        backgroundColor: const Color.fromARGB(255, 156, 248, 138),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 400,
                color: const Color.fromARGB(255, 255, 123, 123),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: usuario,
                        decoration: InputDecoration(
                          hintText: 'Escribe el Usuario',
                        ),
                      ),
                      TextField(
                        controller: password,
                        decoration: InputDecoration(
                          hintText: 'Escribe el Password',
                        ),
                      ),

                      //BOTONES

                      SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text('Aceptar'),
                          onPressed: agregar,
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      //BOTON PARA MANDAR A OTRA VENTANA
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text('Mostrar Datos'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Mostrardatos(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
