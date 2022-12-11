//import 'package:sqlite/operador.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'operador.dart';

class DB {
  static get operadoresMap => null;

  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'operadores.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE operadores (id INTEGER PRIMARY KEY, nombre TEXT, edad INTEGER)");
    }, version: 1);
  }

  static Future<Future<int>> insert(Operador operador) async {
    Database database = await _openDB();

    return database.insert("operadores", operador.toMap());
  }

  static Future<Future<int>> delete(Operador operador) async {
    Database database = await _openDB();

    return database
        .delete("operadores", where: "id= ?", whereArgs: [operador.id]);
  }

  static Future<Future<int>> update(Operador operador) async {
    Database database = await _openDB();

    return database.update("operadores", operador.toMap(),
        where: "id= ?", whereArgs: [operador.id]);
  }

  static Future<List<Operador>> operadores() async {
    Database database = await _openDB();

    final List<Map<String, dynamic>> maps = await database.query("operadores");

    return List.generate(
        operadoresMap.length,
        (i) => Operador(
            id: operadoresMap[i]['id'],
            nombre: operadoresMap[i]['nombre'],
            apellido: operadoresMap[i]['apellido'],
            DNI: operadoresMap[i]['DNI'],
            sueldo: operadoresMap[i]['sueldo'],
            fechaNac: operadoresMap[i]['fechaNac'],
            edad: operadoresMap[i]['edad']
            ));
  }
}
