import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class perfil extends StatefulWidget {
  const perfil({super.key});

  @override
  State<perfil> createState() => _perfilState();
}

class _perfilState extends State<perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil del usuario"),
      ),
      body: Column(
        children:[
          Image.network(""),
          const Text("Nombre de Usuario"),
          const Text("Correo"),
          const Column(children: [
            Card(
              child: Center(
              child: Row(
                children: [
                  Icon(Icons.arrow_back),
                  Text("")
                ],)
            )
            ),
             Card(
              child: Center(
              child: Row(
                children: [
                  Icon(Icons.arrow_back),
                  Text("")
                ],)
            ))
          ],)
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem> [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label:"Casa"),
                BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label:"Casa"),
                BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label:"Casa"),
            ]
          )
          );
  }
}