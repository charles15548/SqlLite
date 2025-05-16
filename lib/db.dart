
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

  Future<Database> opendatabase() async{
    
    final databasepath = await getDatabasesPath();
    var path = join(databasepath, 'mydatabase.db');

    return openDatabase(
      path,
      onCreate: (db, version) async{
        await db.execute('CREATE TABLE gatos( id INTEGER PRIMARY KEY, name TEXT)');
      }, version: 1
      );
  }


  Future<void> addData(String nombre) async{
    final database = await opendatabase();
    await database.insert(
      'gatos',
       {'name': nombre},
       conflictAlgorithm: ConflictAlgorithm.replace);
       print('Nuevo gato: '+ nombre);
       await database.close();
  }
  
  Future<void> editData(String nombre, int id) async{
    final database = await opendatabase();
    await database.update('gatos', {'name': nombre}, where: 'id = ?', whereArgs: [id]);
    }

  
  Future<void> mostrar() async{
    final database = await opendatabase();
    final data = await database.query('gatos');
    print (data);

    await database.close();
  }
  Future<List<Map<String,dynamic>>> obtener() async{
    final database = await opendatabase();
    final data = await database.query('gatos');
    print (data);

    await database.close();
    return data;
  }
   Future<void> eliminar(int id) async{
    final database = await opendatabase();
    final deleterows = await database.delete('gatos', where: 'id=?'  ,whereArgs: [id] );
    
    print (deleterows);

    await database.close();
  }

  
}