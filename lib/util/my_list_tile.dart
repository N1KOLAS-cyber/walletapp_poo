// ignore_for_file: public_member_api_docs, sort_constructors_first
// Se indica que se ignoren advertencias relacionadas con documentación pública y el orden de los constructores en la clase

import 'package:flutter/material.dart';
// Importa el paquete 'flutter/material.dart', que proporciona widgets y herramientas para crear interfaces gráficas de usuario en Flutter

import 'package:google_fonts/google_fonts.dart';
// Importa el paquete 'google_fonts', que permite usar fuentes de Google en la aplicación

// Define una clase MyListTile que extiende de StatelessWidget, lo que significa que este widget no tiene estado mutable
class MyListTile extends StatelessWidget {
  // Declara tres variables finales que son requeridas al construir el widget
  final String titleList;    // Título que se mostrará en el widget
  final String subtitleList; // Subtítulo que se mostrará debajo del título
  final String iconPath;     // Ruta del ícono que se mostrará en el widget

  // Constructor de la clase MyListTile, que requiere los tres parámetros
  const MyListTile({
    super.key, // Clave opcional para el widget
    required this.titleList,    // Asigna el título
    required this.subtitleList, // Asigna el subtítulo
    required this.iconPath,     // Asigna la ruta del ícono
  });

  // Método build que describe cómo construir el widget
  @override
  Widget build(BuildContext context) {
    return Row( 
      // Utiliza un Row para colocar los elementos horizontalmente
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye los elementos con espacio entre ellos
      children: [
        Row( // Crea una fila adicional para los elementos a la izquierda
          children: [
            Row( // Crea otra fila interna para los iconos y textos
              children: [
                // Contenedor que envuelve la imagen del ícono
                Container(
                  padding: const EdgeInsets.all(15.0), // Añade padding de 15 píxeles alrededor del contenedor
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0), // Bordes redondeados con radio de 16 píxeles
                    color: Colors.blue.withOpacity(.2), // Color azul con opacidad de 0.2
                  ),
                  height: 70, // Establece la altura del contenedor en 70 píxeles
                  child: Image.asset(iconPath), // Carga la imagen desde los assets usando la ruta proporcionada
                ),
              ],
            ),
            const SizedBox( // Crea un espacio vacío entre el ícono y el texto
              width: 10, // Establece un espacio de 10 píxeles
            ),
            Column( // Utiliza un Column para colocar el texto en columnas
              crossAxisAlignment: CrossAxisAlignment.start, // Alinea los textos hacia la izquierda
              children: [
                // Título del widget, utilizando una fuente personalizada de Google
                Text(
                  titleList, // El texto del título
                  style: GoogleFonts.poppins( // Aplica una fuente de Google llamada 'Poppins'
                    fontSize: 16, // Tamaño de fuente de 16 píxeles
                    fontWeight: FontWeight.w600, // Peso de la fuente en 600 (semi-negrita)
                  ),
                ),
                const SizedBox( // Crea un espacio de 7 píxeles entre el título y el subtítulo
                  height: 7,
                ),
                // Subtítulo del widget, utilizando una fuente personalizada de Google
                Text(
                  subtitleList, // El texto del subtítulo
                  style: GoogleFonts.poppins( // Aplica una fuente de Google llamada 'Poppins'
                    color: Colors.grey, // Color gris para el subtítulo
                  ),
                ),
              ],
            ),
          ],
        ),
        // Icono de flecha que indica que se puede navegar hacia una nueva pantalla o sección
        const Icon(
          Icons.arrow_forward_ios_rounded, // El ícono de la flecha
          size: 20, // Establece el tamaño del ícono a 20 píxeles
          color: Colors.grey, // Establece el color del ícono a gris
        ),
      ],
    );
  }
}
