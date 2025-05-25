import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/services.dart';
import 'package:programa1_p4/basedatos/BD.dart';
import 'package:programa1_p4/widget/MostrarDatos.dart';

class Basedatos extends StatefulWidget {
  const Basedatos({super.key});

  @override
  State<StatefulWidget> createState() {
    return BaseDatos();
  }
}

class BaseDatos extends State<Basedatos> {
  final TextEditingController producto = TextEditingController();
  final TextEditingController cantidad = TextEditingController();
  final TextEditingController precio = TextEditingController();

  void agregar() async {
    String u = producto.text;
    String p = precio.text;
    String c = cantidad.text;

    if (u.isEmpty || p.isEmpty || c.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Faltan Datos')),
      );
    } else {
      await BD().insertarProductos(u, p, c);
      producto.clear();
      precio.clear();
      cantidad.clear();

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Producto Guardado'),
              content: Text(':D'),
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Programa2_P3',
            style: TextStyle(color: const Color.fromARGB(255, 246, 246, 246)),
          ),
          backgroundColor: const Color.fromARGB(255, 157, 46, 171)),
      backgroundColor: const Color.fromARGB(255, 109, 3, 136),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 400,
                color: const Color.fromARGB(255, 210, 147, 237),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: producto,
                        decoration: InputDecoration(
                          hintText: 'Escribe el producto',
                        ),
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 254, 254)),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z]')),
                        ],
                      ),
                      //
                      TextField(
                        controller: precio,
                        decoration: InputDecoration(
                          hintText: 'Escribe su Precio',
                        ),
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                      //
                      TextField(
                        controller: cantidad,
                        decoration: InputDecoration(
                          hintText: 'Escribe la Cantidad',
                        ),
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 253, 253)),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
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
