
import 'package:flutter/material.dart';
import 'package:gestion_autos/controllers/cliente_controller.dart';
import 'package:gestion_autos/view/01login.dart';

class registro extends StatefulWidget {
  const registro({super.key});

  @override
  State<registro> createState() => _registroState();
}

class _registroState extends State<registro> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _numLicController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordValidaController = TextEditingController();
  final ClienteService serviciosCliente = ClienteService() ;

  void registrarCliente() async{
    final nombre= _nombreController.text;
    final numLic= _numLicController.text;
    final correo= _correoController.text;
    final password= _passwordController.text;
    final passwordValida= _passwordValidaController.text;

  if(password != passwordValida){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('La contraseña no coincide')),
    );
    return;
  }
  try{
    final response = await serviciosCliente.registrarCliente(nombre, correo, numLic, password);
    print('Status codigo: ${response.statusCode}');
    print('Response body: ${response.body}');

    if(response.statusCode == 200 || response.statusCode == 201){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registro Exitoso'),));
      setState((){
        _nombreController.clear();
        _correoController.clear();
        _numLicController.clear();
        _passwordController.clear();
        _passwordValidaController.clear();
      });

      Future.delayed(const Duration(seconds:2),(){
        Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (context)=> const Login()),);
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content:Text('Error en el registro')),
      );
    } 
  }catch (e) {
    print("Error en el registro: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Error en la conexión con el servidor')),
    );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
                child: Form(
                    child: Column(
              children: [
                Image.network(
                  "https://static-00.iconduck.com/assets.00/profile-user-icon-512x512-nm62qfu0.png",
                  height: 200,
                  width: 200,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _nombreController,
                  decoration: const InputDecoration(
                    labelText: "Nombre del Usuario",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,),
                TextFormField(
                  controller: _correoController,
                  decoration: const InputDecoration(
                    labelText: "Correo Electrónico",
                    border: OutlineInputBorder(),
                  ),
                  /* Validación */
                ),
                const SizedBox(
                  height: 10,),
                TextFormField(
                  controller: _numLicController,
                  decoration: const InputDecoration(
                    labelText: "Número de Licencia",
                    border: OutlineInputBorder(),
                  ),
                  /* Validación */
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField( 
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: "Contraseña",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField( 
                  controller: _passwordValidaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Confirmar Contraseña",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                     registrarCliente();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 126, 126, 126),
                      minimumSize: const Size(double.infinity, 50),
                      elevation: 50,
                    ),
                    child: Text(
                      "Resgistrar",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                    const SizedBox(
                  height: 16,
                ),
                    Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("¿Ya tienes una cuenta? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text(
                    "Inicia Sesión",
                    style: TextStyle(
                      color: Colors.blue[300],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            ])
            )
            )));
  }
}
