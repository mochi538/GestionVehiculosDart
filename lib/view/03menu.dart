import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gestion_autos/view/cars/01car.dart';
import 'package:gestion_autos/view/cars/02car.dart';
import 'package:gestion_autos/view/cars/03car.dart';
import 'package:gestion_autos/view/cars/04car.dart';



class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alquiler de vehículos"),
      ),
      body: Column(
        children:[
          Row(
            children:[
              Center(
                child:InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>carUno())
                    );
                  },
                  child: Card(
                    child:Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(children: [
                        Image.network(""),
                        Text("Hola")
                      ],),
                    )
                  ),
                ),
              ),
              Center(
                child:InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>carDos())
                    );
                  },
                  child: Card(
                    child:Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(children: [
                        Image.network(""),
                        Text("Hola")
                      ],),
                    )
                  ),
                ),
              )
            ]
          ),
          Row(
            children:[
              Center(
                child:InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>carTres())
                    );
                  },
                  child: Card(
                    child:Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(children: [
                        Image.network(""),
                        Text("Hola")
                      ],),
                    )
                  ),
                ),
              ),
              Center(
                child:InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>carCuatro())
                    );
                  },
                  child: Card(
                    child:Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(children: [
                        Image.network(""),
                        Text("Hola")
                      ],),
                    )
                  ),
                ),
              )
            ]
          ),
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