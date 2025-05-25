import 'package:flutter/material.dart';
import 'package:pro6_p3/widget/QRBase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QRBase(),
    );
  }
}
