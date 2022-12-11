import 'package:flutter/material.dart';
//import 'package:sqflite/sqflite.dart';
import 'package:flutter_app/db.dart';
import 'package:flutter_app/ficharegistro.dart';
import 'package:flutter_app/listaregistro.dart';
import 'package:flutter_app/nuevoregistro.dart';

import 'listaregistro.dart';
import 'ficharegistro.dart';
import 'nuevoregistro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Registro(),
    );
  }
}

class Registro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistroState();
  }
}

class RegistroState extends State<Registro> {
  List<Registro> listaRegistro; //VERIFICAR!!!

  @override
  Widget build(BuildContext context) {
    if (listaRegistro == null) listaRegistro = [];

    return Scaffold(
        appBar: AppBar(title: Text('Lista de Registro')),
        body: ListView.builder(
            itemCount: listaRegistro.length,
            itemBuilder: (BuildContext context, int posicion) {
              final item = listaRegistro[posicion];

              return new GestureDetector(
                  onTap: () {
                    _editaRegistro(listaRegistro[posicion], this, posicion);
                  },
                  child: Dismissible(
                    key: Key(item.nombre),
                    onDismissed: (direction) {
                      eliminar(posicion);
                    },
                    child: Card(
                        margin: EdgeInsets.all(1.0),
                        elevation: 2.0,
                        child: FichaRegistro(
                          titulo: item.nombre,
                          estado: item.estado,
                        )),
                  ));
            }));
  }

  void _editaRegistro(Registro registro, ListaRegistroState obj, int posicion) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                nuevoRegistro(registro, 'Editar Registro', obj, posicion)));
    actualizarListView();
  }

  void eliminar(int posicion) {
    this.listaRegistro.remove(posicion);
    actualizarListView();
  }

  void actualizarListView() {
    setState(() {
      this.listaRegistro = listaRegistro;
    });
  }
}
