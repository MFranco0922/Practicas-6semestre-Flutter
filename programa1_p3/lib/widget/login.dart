import 'package:flutter/material.dart';
import 'package:programa1_p3/basedatos/BD.dart';
import 'package:programa1_p3/widget/basedatos.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return BaseDatos();
  }
}

class BaseDatos extends State<Login> {
  final TextEditingController usuario = TextEditingController();
  final TextEditingController password = TextEditingController();

  void agregar() async {
    String u = usuario.text;
    String p = password.text;

    if (u.isNotEmpty && p.isNotEmpty) {
      bool respuesta = await BD().ValidarUsuario(u, p);

      if (respuesta) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Basedatos()),
        );

        //
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Errorcito'),
                content: Text('Usuarito no encontradito'),
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

      /*showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Datos ingresados'),
              content: Text('Datos vacíos'),
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
      */
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Practica Bases de Datos"),
        backgroundColor: const Color.fromARGB(255, 231, 168, 251),
      ),
      backgroundColor: const Color.fromARGB(255, 58, 2, 64),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 400,
                color: const Color.fromARGB(255, 203, 153, 208),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                          color: const Color.fromARGB(255, 128, 16, 173),
                        ),
                      ),
                      TextField(
                        controller: usuario,
                        decoration: InputDecoration(
                          labelText: 'Escribe el Usuario',
                        ),
                      ),
                      TextField(
                        controller: password,
                        decoration: InputDecoration(
                          labelText: 'Escribe el Password',
                        ),
                      ),

                      //BOTONES

                      SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text('Validar'),
                          onPressed: agregar,
                        ),
                      ),

                      SizedBox(
                        height: 10,
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
