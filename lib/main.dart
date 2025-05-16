
import 'package:flutter/material.dart';
import 'package:gato/gatos.dart';

void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'App de Gatos',
      home: Gatos(), // Aquí va tu widget con el Scaffold
      debugShowCheckedModeBanner: false,
    );
  }
}