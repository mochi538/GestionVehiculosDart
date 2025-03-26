import 'package:flutter/material.dart';
import 'package:gestion_autos/view/02registro.dart';
import 'package:gestion_autos/controllers/cliente_controller.dart';
import 'package:gestion_autos/view/03menu.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ClienteService clienteService = ClienteService();

  void iniciarSesion()async{
    final correo = _correoController.text;
    final password = _passwordController.text;

    final resultado = await clienteService.loginCliente(correo,password);

    if(resultado['success'] && resultado.containsKey('cliente')){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Inicio de sesión exitoso')));
      Future.delayed(const Duration(seconds:1),(){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)=> Menu()), 
        );
      });
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Credenciales incorrectas'),));
      }
    }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar:AppBar(
              
            ),
        body:
        Padding(
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
                  controller: _correoController,
                  decoration: const InputDecoration(
                    labelText: "Correo Electrónico",
                    prefixIcon: Icon(Icons.email, color:Colors.white),
                    border: OutlineInputBorder(),
                  ), /* Validación */
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: "password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                       iniciarSesion();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 126, 126, 126),
                      minimumSize: const Size(double.infinity, 50),
                      elevation: 50,
                    ),
                    child: Text(
                      "Ingresar",
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
                        MaterialPageRoute(builder: (context) => registro()));
                  },
                  child: Text(
                    "Regístrate",
                    style: TextStyle(
                      color: Colors.blue[300],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

              ],
            )
            )
            )
            )
          
        );
  }
}