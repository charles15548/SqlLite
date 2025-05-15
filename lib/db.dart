
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

  Future<void> mostrar() async{
    final database = await opendatabase();
    final data = await database.query('gatos');
    print (data);

    await database.close();
  }
}