import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:programa1_p4/basedatos/BD.dart';

class Mostrardatos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Lista();
}

class Lista extends State<Mostrardatos> {
  List<Map<String, dynamic>> productos = [];

  @override
  void initState() {
    super.initState();
    obtenerUsuarios();
  }

  void obtenerUsuarios() async {
    List<Map<String, dynamic>> datos = await BD().obtenerProductos();
    setState(() {
      productos = datos;
    });
  }

  void EliminarProductos(String producto) async {
    await BD().EliminarProducto(producto);
    obtenerUsuarios();
  }

  void ModificarProductos() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mostrar Datos ',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 198, 255, 152),
      ),

      //LISTAAAAS

      body: productos.isEmpty
          ? Center(child: Text('Lista Vacia'))
          : ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.add_a_photo_outlined),
                  title: Text('Producto:${productos[index]['producto']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Precio: ${productos[index]['precio']}'),
                      Text('Cantidad: ${productos[index]['cantidad']}'),
                    ],
                  ),
                  trailing: Wrap(
                    direction: Axis.vertical,
                    spacing: 5,

                    //BOTONES DE FORMA EN ICONO ELIMINAR
                    children: [
                      IconButton(
                        onPressed: () {
                          onPressed:
                          EliminarProductos(productos[index]['producto']);
                        },
                        icon: Icon(Icons.delete),
                      ),

                      //PARA MODIFICAR
                      IconButton(
                        onPressed: () {
                          onPressed:
                          ModificarProductos(
                              //usuarios[index]['id'],
                              // usuarios[index]['usuario'],
                              //usuarios[index]['password'],
                              );
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
