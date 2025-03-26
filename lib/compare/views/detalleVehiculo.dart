/* import 'package:flutter/material.dart';
import 'package:flutter_alquiler_autos/views/medioPago.dart';

class DetalleVehiculoScreen extends StatelessWidget {
  final String imageUrl;
  final String marca;
  final String modelo;
  final String anio;
  final int disponibilidad;

  DetalleVehiculoScreen({
    required this.imageUrl,
    required this.marca,
    required this.modelo,
    required this.anio,
    required this.disponibilidad,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Vehículo'),
        backgroundColor: Colors.red[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del vehículo
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Marca
            Text(
              'Marca: $marca',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            // Modelo
            Text(
              'Modelo: $modelo',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8.0),
            // Año
            Text(
              'Año: $anio',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8.0),
            // Disponibilidad
            Text(
              'Disponibilidad: ${disponibilidad > 0 ? 'Disponible' : 'No Disponible'}',
              style: TextStyle(
                fontSize: 16,
                color: disponibilidad > 0 ? Colors.green : Colors.red,
              ),
            ),
            Spacer(),
            // Botón de Alquilar Vehículo
            Center(
              child: ElevatedButton.icon(
                onPressed: disponibilidad > 0 ? () {
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => medioPago()));
                } : null,
                icon: Icon(Icons.directions_car),
                label: Text('Alquilar Vehículo'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: disponibilidad > 0 ? Colors.red[300] : Colors.grey,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 */