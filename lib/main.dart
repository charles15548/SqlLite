import 'package:flutter/material.dart';
import 'package:gato/db.dart';

void main() {
  runApp(MyApp());
}

final TextEditingController nombre = TextEditingController();
String nameString = nombre.text;

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          children: <Widget>[
            Text('Data: '),
            TextField(
              controller: nombre,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: agregar, child: Text('Agregar')),
            
            ElevatedButton(onPressed: mostrar, child: Text('Mostrar')),
            SizedBox(
              height: 10,
            ),
            Text('Todos tus Gatos son los siguientes: ',
            ),
            Text(''),
          ],
        )),
      ),
    );
  }

  void agregar() async {
    await dbHelper.addData(nameString);
  }
  void mostrar() async{
    await dbHelper.mostrar();
  }
}
