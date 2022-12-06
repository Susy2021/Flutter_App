
class Operador {
  int id;
  String nombre;
  int edad;


  Operador ({required this.id, required this.nombre, required this.edad});

  Map<String, dynamic> toMap() {
    return {'id': id, 'nombre': nombre, 'edad': edad};
    }
  }