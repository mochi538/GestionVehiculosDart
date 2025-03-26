/* import 'package:flutter/material.dart';
import 'package:flutter_alquiler_autos/controllers/autos_controller.dart';
import 'package:flutter_alquiler_autos/views/detalleVehiculo.dart';
import 'package:flutter_alquiler_autos/views/menuDrawerPerfil.dart';

class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  final AutosController autosController =
      AutosController(); //instanciar el metodo
  List<Map<String, dynamic>> listaDeAutos =
      []; //lista se almacenaran los autos que vienen de la API
  bool isLoading = true; // Indicador de progreso de carga

  void initState() {
    //llamar al metodo cargarAutos() cada vez que la pantalla se crea
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
      drawer: MenuDrawerPerfil(),
      appBar: AppBar(
        title: Text('Alquiler de Vehículos'),
        backgroundColor: Colors.red[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Cuadro de búsqueda con icono
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: 'Buscar vehículo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16.0),
            // Lista de vehículos
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : listaDeAutos.isEmpty
                      ? Center(child: Text('No hay vehiculos disponibles'))
                      : ListView.builder(
                          itemCount: listaDeAutos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Image.asset('assets/auto.png', width: 60, height: 50),
                              title: Text(
                                  '${listaDeAutos[index]['marca']} ${listaDeAutos[index]['modelo']}'),
                              subtitle: Text(
                                  'Año: ${listaDeAutos[index]['anio']} - ${listaDeAutos[index]['valorAlquiler']}'),
                              trailing: Icon(Icons.arrow_forward_ios,
                                  color: Colors.red[300]),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetalleVehiculoScreen(
                                      imageUrl: listaDeAutos[index]['imageUrl'] ?? 'https://png.pngtree.com/png-vector/20190403/ourmid/pngtree-red-vector-element-of-automobile-png-image_913757.jpg',
                                      marca: listaDeAutos[index]['marca'],
                                      modelo: listaDeAutos[index]['modelo'],
                                      anio: listaDeAutos[index]['anio'],
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
        items: [
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
 */