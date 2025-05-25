import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
//import 'package:path/path.dart';
import 'package:pro6_p3/basedatos/BDHelper.dart';
import 'package:pro6_p3/widget/Mostrar.dart';

class QRBase extends StatefulWidget {
  const QRBase({super.key});

  @override
  State<StatefulWidget> createState() {
    return Clase();
  }
}

class Clase extends State<QRBase> {
  bool ventana = false;

  void MostrarDatosQR(String numeros) {
    String nombre = "", precio = "";

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Dato QR'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Codigo $numeros',
                  style: TextStyle(
                    backgroundColor: Colors.black12,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                //
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                  ),
                  onChanged: (value) => nombre = value,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Precio',
                  ),
                  onChanged: (value) => precio = value,
                ),
              ],
            ),
            //BOTON
            actions: [
              TextButton(
                onPressed: () async {
                  if (nombre.isNotEmpty && precio.isNotEmpty) {
                    double pre = double.parse(precio);
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Producto Guardado')),
                    );
                    await BDHelper().insertarProducto(numeros, nombre, pre);
                  }
                  setState(() {
                    ventana = false;
                  });
                  //Navigator.of(context).pop();
                },
                child: Text('Guardar'),
              ),
            ],
          );
        }).then((_) => ventana = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicacion QR con base de datos'),
        backgroundColor: const Color.fromARGB(255, 157, 241, 212),
        //
        //BOTON
        actions: [
          IconButton(
            onPressed: () {
              //print('Datos');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mostrar()),
              );
            },
            icon: Icon(Icons.list),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 104, 214, 201),
      body: MobileScanner(
        onDetect: (capture) {
          if (ventana) return;

          final codigo = capture.barcodes.first;
          final String numeros = codigo.rawValue ?? 'Sin Codigo';

          if (numeros != 'Sin Codigo') {
            ventana = true;
            //print(numeros);
            MostrarDatosQR(numeros);
          }
        },
      ),
    );
  }
}
