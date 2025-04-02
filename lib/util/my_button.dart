// Importación de los paquetes necesarios para la interfaz de usuario y fuentes personalizadas
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Definición de un widget personalizado llamado MyButton
class MyButton extends StatelessWidget {
  // Variables finales que almacenan la ruta del ícono y el texto del botón
  final String iconPath;
  final String txtButton;

  // Constructor de la clase MyButton con parámetros requeridos
  const MyButton({super.key, required this.iconPath, required this.txtButton});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Contenedor que representa el botón con un ícono
        Container(
          height: 70, // Altura del contenedor
          padding: const EdgeInsets.all(15), // Espaciado interno
          decoration: BoxDecoration(
            color: Colors.grey[100], // Color de fondo
            borderRadius: BorderRadius.circular(16.0), // Bordes redondeados
            border: Border.all(
              color: Colors.grey.shade300, // Color del borde
              width: 1.0, // Grosor del borde
              strokeAlign: BorderSide.strokeAlignInside, // Alineación del borde
            ),
          ),
          child: Image.asset(iconPath), // Imagen dentro del contenedor
        ),
        
        const SizedBox(
          height: 10, // Espaciado entre el ícono y el texto
        ),
        
        // Texto que representa el título del botón
        Text(
          txtButton, // Texto dinámico del botón
          style: GoogleFonts.poppins(
            fontSize: 15, // Tamaño del texto
            fontWeight: FontWeight.w500, // Grosor del texto
          ),
        )
      ],
    );
  }
}
