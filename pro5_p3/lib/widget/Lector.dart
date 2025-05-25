import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';

class Lector extends StatefulWidget {
  const Lector({super.key});

  @override
  State<StatefulWidget> createState() {
    return Clase();
  }
}

class Clase extends State<Lector> {
  bool ventana = false;

  void MostrarDatosQR(String numeros) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Dato QR'),
          content: Center(
            child: (Text('Codigo: $numeros')),
          ),

          //BOTON
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  ventana = false;
                });
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  //
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lector de QR'),
      ),
      backgroundColor: const Color.fromARGB(255, 197, 244, 231),
      body: MobileScanner(
        //Appbar
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
