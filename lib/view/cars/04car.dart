import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class carCuatro extends StatefulWidget {
  const carCuatro({super.key});

  @override
  State<carCuatro> createState() => _carCuatroState();
}

class _carCuatroState extends State<carCuatro> {
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
