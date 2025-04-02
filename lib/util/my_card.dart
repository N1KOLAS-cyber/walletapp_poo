// Se ignoran ciertas advertencias del analizador de Dart
// ignore_for_file: public_member_api_docs, sort_constructors_first

// Importación del paquete de Flutter para construir la interfaz de usuario
import 'package:flutter/material.dart';
// Importación del paquete para utilizar fuentes personalizadas de Google
import 'package:google_fonts/google_fonts.dart';

// Definición de un widget con estado llamado MyCard
class MyCard extends StatefulWidget {
  // Declaración de variables finales para almacenar los datos de la tarjeta
  final double balance; // Saldo disponible en la tarjeta
  final int expireMonth; // Mes de expiración de la tarjeta
  final int expireYear; // Año de expiración de la tarjeta
  final Color color; // Color de fondo de la tarjeta

  // Constructor de la clase MyCard con parámetros requeridos
  const MyCard({
    super.key, // Clave única del widget
    required this.balance, // Parámetro requerido para el saldo
    required this.expireMonth, // Parámetro requerido para el mes de expiración
    required this.expireYear, // Parámetro requerido para el año de expiración
    required this.color, // Parámetro requerido para el color de la tarjeta
  });

  @override
  State<MyCard> createState() => _MyCardState(); // Creación del estado del widget
}

// Estado asociado a MyCard
class _MyCardState extends State<MyCard> {
  // Variable booleana para controlar la visibilidad del número de tarjeta
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0), // Margen horizontal del contenedor
      child: Container(
        padding: const EdgeInsets.only(
            left: 25.0, right: 25.0, top: 25.0, bottom: 17.0), // Espaciado interno del contenedor
        decoration: BoxDecoration(
          color: widget.color, // Asigna el color de la tarjeta
          borderRadius: BorderRadius.circular(16), // Bordes redondeados
        ),
        child: Column(
          children: [
            // Fila superior con balance y logo
            Row(
              crossAxisAlignment: CrossAxisAlignment.start, // Alineación superior de los elementos
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaciado entre elementos
              children: [
                // Columna izquierda con el texto "Balance" y el saldo
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Alineación a la izquierda
                  children: [
                    Text(
                      "Balance", // Texto estático para indicar el saldo
                      style: GoogleFonts.poppins(
                          fontSize: 15, // Tamaño de fuente
                          fontWeight: FontWeight.w500, // Grosor de la fuente
                          color: Colors.white, // Color del texto
                          height: 1.2), // Espaciado entre líneas
                    ),
                    const SizedBox(
                      height: 6, // Espaciado entre el texto y el saldo
                    ),
                    Text(
                      widget.balance.toString(), // Convierte el saldo en texto y lo muestra
                      style: GoogleFonts.poppins(
                          fontSize: 25, // Tamaño de fuente
                          fontWeight: FontWeight.bold, // Grosor de la fuente en negrita
                          color: Colors.white, // Color del texto
                          height: 1.2), // Espaciado entre líneas
                    ),
                  ],
                ),
                // Texto "VISA" que representa la marca de la tarjeta
                Text(
                  "VISA", // Texto de la marca de la tarjeta
                  style: GoogleFonts.roboto(
                      fontSize: 20, // Tamaño de fuente
                      fontWeight: FontWeight.w500, // Grosor de la fuente
                      color: Colors.blue[200], // Color del texto
                      height: 1.2), // Espaciado entre líneas
                ),
              ],
            ),
            const SizedBox(
              height: 40, // Espaciado entre las secciones
            ),
            
            // Fila inferior con número de tarjeta y fecha de expiración
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribución de los elementos
              children: [
                // Fila con el número de tarjeta y botón para ocultar/mostrar
                Row(
                  children: [
                    Text(
                      isObsecure ? "****3456" : "12343456", // Muestra el número de tarjeta parcial o completo
                      style: GoogleFonts.poppins(
                          fontSize: 15, // Tamaño de fuente
                          fontWeight: FontWeight.w500, // Grosor de la fuente
                          color: Colors.white, // Color del texto
                          height: 1.2), // Espaciado entre líneas
                    ),
                    // Botón de visibilidad del número de tarjeta
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isObsecure = !isObsecure; // Alterna entre mostrar y ocultar el número
                        });
                      },
                      icon: Icon(
                        isObsecure ? Icons.visibility : Icons.visibility_off, // Ícono de ojo abierto o cerrado
                        size: 20, // Tamaño del ícono
                        color: Colors.white, // Color del ícono
                      ),
                    )
                  ],
                ),
                // Texto con la fecha de expiración de la tarjeta
                Text(
                  "${widget.expireMonth}/${widget.expireYear}", // Formato MM/YY
                  style: GoogleFonts.poppins(
                      fontSize: 15, // Tamaño de fuente
                      fontWeight: FontWeight.w500, // Grosor de la fuente
                      color: Colors.white, // Color del texto
                      height: 1.2), // Espaciado entre líneas
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
