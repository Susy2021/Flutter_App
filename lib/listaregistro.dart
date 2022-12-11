class Lista {
  String _nombre;
  String _estado;

  Lista(this._nombre, this._estado);

  String get nombre => _nombre;
  String get estado => _estado;

  set nombre(String nuevoNombre) {
    if (nuevoNombre.length <= 255) {
      this._nombre = nuevoNombre;
    }
  }

  set estado(String nuevoEstado) => this._estado = nuevoEstado;
}
