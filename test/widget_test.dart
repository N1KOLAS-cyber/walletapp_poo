// This is a basic Flutter widget test.
// Este es un test básico de widgets de Flutter

// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// Para realizar una interacción con un widget en tu test, usa la utilidad WidgetTester
// del paquete flutter_test. Por ejemplo, puedes enviar gestos de tap y scroll
// También puedes usar WidgetTester para encontrar widgets hijos en el árbol de widgets,
// leer texto y verificar que los valores de las propiedades del widget sean correctos.

import 'package:flutter/material.dart';
// Importa el paquete 'material.dart' que proporciona herramientas y widgets para crear una interfaz de usuario con el diseño Material

import 'package:flutter_test/flutter_test.dart';
// Importa el paquete 'flutter_test.dart', que proporciona las utilidades necesarias para escribir pruebas de widgets en Flutter

import 'package:walletapp_ui/main.dart';
// Importa el archivo principal 'main.dart' de la aplicación para acceder al widget 'MyApp' que se va a probar

void main() {
  // Define la función main que se ejecuta al iniciar las pruebas

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Define un test de widget llamado 'Counter increments smoke test'
    // El parámetro 'tester' es el objeto que permite interactuar con los widgets en el test

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    // Se construye la aplicación utilizando 'tester.pumpWidget' y se dispara el primer fotograma de la interfaz

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    // Verifica que el texto '0' está presente en el widget, lo cual confirma que el contador comienza en 0
    expect(find.text('1'), findsNothing);
    // Verifica que el texto '1' no está presente en el widget al inicio

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    // Realiza un tap en el ícono '+' (que representa el aumento del contador)
    await tester.pump();
    // Dispara otro fotograma para actualizar el widget después del tap

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    // Verifica que el texto '0' ya no está presente después de incrementar el contador
    expect(find.text('1'), findsOneWidget);
    // Verifica que el texto '1' aparece en el widget, lo que indica que el contador ha incrementado
  });
}
