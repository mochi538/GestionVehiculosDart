import 'dart:convert';
import 'package:http/http.dart' as http;

class AutosController {
  final String baseUrl = "https://gestionautos-backend-sql.onrender.com/api/autos";
  Future<List<Map<String, dynamic>>> obtenerAutosDisponibles() async{
 
    try{
      final url = Uri.parse(baseUrl);
      final response = await http.get(url);

      if (response.statusCode==200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((auto) { 
          return {
            'marca': auto['marca'],
            'modelo': auto['modelo'],
            'imageUrl': auto['imagen'] ?? 'https://img.freepik.com/vector-gratis/plantilla-logotipo-centro-coches_1057-4908.jpg?t=st=1742353852~exp=1742357452~hmac=c5da8ee01d3130f807b1844568d189e83dbf4b6f95fe1e74b6bbd358dc8ac82e&w=740',
            'valorAlquiler': auto['valorAlquiler'],
            'year': auto['year'],
            'disponibilidad': auto['disponibilidad'],
          };
        }).toList();
      }else{
        throw Exception('Error al obtener los vehiculos');
      }
    } catch(e){
      print('Error en obtener Autos: $e');
      return [];
    }
  }
}