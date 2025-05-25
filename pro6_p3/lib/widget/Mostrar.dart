import 'package:flutter/material.dart';
import 'package:pro6_p3/basedatos/BDHelper.dart';

class Mostrar extends StatefulWidget {
  const Mostrar({super.key});

  @override
  State<StatefulWidget> createState() {
    return Clase();
  }
}

class Clase extends State<Mostrar> {
  List<Map<String, dynamic>> productos = [];

  //CARGAR LOS DATOS DE LA BD
  void cargarDatos() async {
    List<Map<String, dynamic>> valores = await BDHelper().obtenerProductos();
    setState(() {
      productos = valores;
    });
  }

  void initState() {
    super.initState();
    cargarDatos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mostrar Datos'),
        backgroundColor: const Color.fromARGB(255, 135, 247, 180),
      ),
      body: productos.isEmpty
          ? Center(child: Text('No hay productos'))
          : ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Clave'),
                  subtitle: Text('Nombre'),
                  trailing: Text('Precio'),
                  textColor: Colors.black,
                );
              }),
    );
  }
}
