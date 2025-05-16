import 'package:flutter/material.dart';
import 'package:gato/db.dart';

class Gatos extends StatefulWidget {
  const Gatos({super.key});

  @override
  State<Gatos> createState() => _GatosState();
}

class _GatosState extends State<Gatos> {
  @override
  void initState() {
    super.initState();
    obtener();
  }

  final dbHelper = DatabaseHelper();
  final TextEditingController nombre = TextEditingController();
  final TextEditingController idGato = TextEditingController();
  List<Map<String, dynamic>> listaGatos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guarda tus gatos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'TUS DATOS:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: nombre,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: agregar, child: Text('Agregar')),
            ElevatedButton(onPressed: obtener, child: Text('Mostrar')),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: idGato,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Todos tus gatos:",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
                child: ListView.builder(
                    itemCount: listaGatos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('${listaGatos[index]}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children:[
                            IconButton(onPressed: ()=> editar(listaGatos[index]['id']), icon: Icon(Icons.edit)),
                            IconButton(onPressed: ()=> eliminar(listaGatos[index]['id']), icon: Icon(Icons.delete))
                          ]
                        ),
                       //trailing: IconButton(onPressed: () => editar(listaGatos[index]['id']), icon: Icon(Icons.edit)),
                        
                      );
                    }))
          ],
        ),
      ),
    );
  }

  void agregar() async {
    await dbHelper.addData(nombre.text);
    obtener();
  }

  void editar(int id) async {
    await dbHelper.editData(nombre.text, id);
    obtener();
  }

  void obtener() async {
    final datos = await dbHelper.obtener();
    setState(() {
      listaGatos = datos;
    });
  }

  void eliminar(int id) async {
    await dbHelper.eliminar(id);
    obtener();
  }
}
