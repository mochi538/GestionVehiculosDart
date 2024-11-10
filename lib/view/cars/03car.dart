import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class carTres extends StatefulWidget {
  const carTres({super.key});

  @override
  State<carTres> createState() => _carTresState();
}

class _carTresState extends State<carTres> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar:AppBar(
              title: Text("Detalle vehículo"),
            ),
        body:Column(
          children: [
            Image.network(""),
            Text("Marca: Toyota"),
            Text("Modelo: Corolle"),
            Text("Año: 2022"),
            Text("Disponibilidad: Disponible"),
            ElevatedButton(onPressed: (){}, child: 
            Text("Alquilar Vehículo"))
          ],
        )
          
        );
  }
}
