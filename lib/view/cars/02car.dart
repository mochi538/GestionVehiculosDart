import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class carDos extends StatefulWidget {
  const carDos({super.key});

  @override
  State<carDos> createState() => _carDosState();
}

class _carDosState extends State<carDos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar:AppBar(
              title: const Text("Detalle vehículo"),
            ),
        body:Column(
          children: [
            Image.network(""),
            const Text("Marca: Toyota"),
            const Text("Modelo: Corolle"),
            const Text("Año: 2022"),
            const Text("Disponibilidad: Disponible"),
            ElevatedButton(onPressed: (){}, child: 
            const Text("Alquilar Vehículo"))
          ],
        )
          
        );
  }
}
