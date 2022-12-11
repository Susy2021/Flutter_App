// ignore_for_file: non_constant_identifier_names

class Operador {
  int id;
  String nombre;
  String apellido;
  int DNI;
  int sueldo;
  int fechaNac;
  int edad;

  Operador({required this.id, required this.nombre, required this.apellido, 
            required this.DNI, required this.sueldo, required this.fechaNac, required this.edad});

  Map<String, dynamic> toMap() {
    return {'id': id, 'nombre': nombre, 'apellido':apellido, 'DNI': DNI, 'sueldo': sueldo, 
          'fechaNac': fechaNac, 'edad': edad};
  }
}
