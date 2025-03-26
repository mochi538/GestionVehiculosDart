import 'package:flutter/material.dart';
import 'package:gestion_autos/controllers/autos_controller.dart';
import 'package:gestion_autos/view/06detallesAuto.dart';
import 'package:gestion_autos/view/04perfil.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final AutosController autosController = AutosController();
  List<Map<String, dynamic>> listaDeAutos =[]; 
  bool isLoading = true; 

  @override
  void initState() {
    super.initState();
    cargarAutos();
  }
  void cargarAutos() async {
    try {
      final autos = await autosController.obtenerAutosDisponibles();
      setState(() {
        listaDeAutos = autos;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error al cargar autos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Perfil(),
      appBar: AppBar(
        title: const Text('Alquiler de Vehículos'),
        backgroundColor: Colors.red[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Cuadro de búsqueda con icono
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: 'Buscar vehículo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : listaDeAutos.isEmpty
                      ? const Center(child: Text('No hay vehiculos disponibles'))
                      : ListView.builder(
                          itemCount: listaDeAutos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Image.asset('assets/auto1.jpg', width: 60, height: 50),
                              title: Text(
                                  '${listaDeAutos[index]['marca']} ${listaDeAutos[index]['modelo']}'),
                              subtitle: Text(
                                  'Año: ${listaDeAutos[index]['year']} - ${listaDeAutos[index]['valorAlquiler']}'),
                              trailing: Icon(Icons.arrow_forward_ios,
                                  color: Colors.red[300]),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetallesAuto(
                                      imageUrl: listaDeAutos[index]['imageUrl'] ?? 'https://png.pngtree.com/png-vector/20190403/ourmid/pngtree-red-vector-element-of-automobile-png-image_913757.jpg',
                                      marca: listaDeAutos[index]['marca'],
                                      modelo: listaDeAutos[index]['modelo'],
                                      year: listaDeAutos[index]['year'],
                                      disponibilidad: listaDeAutos[index]
                                          ['disponibilidad'],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red[300],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Alquiler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Usuario',
          ),
        ],
      ),
    );
  }
}
