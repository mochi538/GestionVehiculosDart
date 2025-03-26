import 'dart:convert'; 
import 'package:http/http.dart' as http;



class ClienteService{
  final String baseUrl ='https://gestionautos-backend-sql.onrender.com/api/clientes';

  //Registro
  Future<http.Response> registrarCliente(
      String nombre, String correo, String numLic, password) async {
    final url = Uri.parse('$baseUrl/registro');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nombre': nombre,
        'correo': correo,
        'numLic': numLic,
        'password': password,
      }),
    );
    return response;
  }


  // login
  Future<Map<String, dynamic>> loginCliente(String correo, String password) async{
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: { 'Content-Type': 'application/json'},
      body: jsonEncode({
        'correo': correo,
        'password': password,
      }),
    );

    final responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return{
        'success': true,
        'mensaje': responseData['mensaje'],
        'cliente': responseData['cliente']
      };
    }else{
      return{
        'success': false,
        'mensaje': responseData['mensaje'] ?? 'Credenciales son incorrectas'
      };
    }
  }
}
