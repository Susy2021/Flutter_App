import 'package:flutter/material.dart';
import 'registro.dart';
import 'ficharegistro.dart';
import 'listaregistro.dart';

class nuevoRegistro extends StatefulWidget {
  final Registro registro;
  final String appBarTitle;
  ListaRegistroState listaRegistroState;
  int posicion;

  nuevoRegistro(this.registro, this.appBarTitle, this.listaRegistroState,
      [this.posicion = -1]);

  @override
  State<StatefulWidget> createState() {
    return NuevoRegistroState(this.registro, this.appBarTitle,
        this.listaRegistroState, this.posicion);
  }
}

class NuevoRegistroState extends State<nuevoRegistro> {
  ListaRegistroState listaRegistroState;
  String titulo;
  Registro registro;
  int posicion;

  NuevoRegistroState(
      this.registro, this.titulo, this.listaRegistroState, this.posicion);

  TextEditingController registroController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    registroController.text = registro.nombre;

    return Scaffold(
      key: GlobalKey<ScaffoldState>(),
      appBar: AppBar(
        leading: new GestureDetector(
            child: Icon(Icons.close),
            onTap: () {
              Navigator.pop(context);
              listaRegistroState.actualizarListView();
            }),
            title: Text(titulo),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 50.0),
            child: _estaEditando(),
            )
        ],
      ) 
    );
  }
}
