import 'package:flutter/material.dart';
// Importa el paquete 'flutter/material.dart' que proporciona las herramientas y widgets necesarios para crear la interfaz gráfica de usuario de Flutter

import 'package:walletapp_ui/page/home_page.dart';
// Importa la clase 'HomePage' desde el archivo 'home_page.dart' ubicado en 'walletapp_ui/page'

void main() {
  runApp(const MyApp());
  // La función 'runApp' inicia la ejecución de la aplicación Flutter y le pasa como parámetro el widget 'MyApp', que es el widget raíz de la aplicación
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Constructor de la clase 'MyApp', que extiende de StatelessWidget y no mantiene ningún estado mutable

  // Este widget es la raíz de tu aplicación
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // 'MaterialApp' es un widget de alto nivel que configura varios aspectos de la aplicación, como el tema, la navegación, etc.
      debugShowCheckedModeBanner: false,
      // Establece que no se debe mostrar el banner de "debug" en el modo de depuración
      title: 'Wallet App UI',
      // Establece el título de la aplicación, que es lo que aparece en la barra de tareas de algunos sistemas operativos o navegadores
      home: HomePage(),
      // Establece la página de inicio de la aplicación, en este caso es 'HomePage', que es el primer widget que se muestra cuando se inicia la aplicación
    );
  }
}
