import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class pago extends StatefulWidget {
  const pago({super.key});

  @override
  State<pago> createState() => _pagoState();
}

class _pagoState extends State<pago> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medio de Pagos"),
      ),
      body: Column(
        children:[
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
          ],
          )
      );
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
          );
  }
}