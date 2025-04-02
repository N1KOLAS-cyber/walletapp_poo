// Importación de los paquetes necesarios para la interfaz de usuario y funcionalidades adicionales
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Fuente personalizada
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Indicador de páginas para el carrusel
import 'package:walletapp_ui/util/my_button.dart'; // Botón personalizado
import 'package:walletapp_ui/util/my_card.dart'; // Tarjeta de crédito personalizada
import 'package:walletapp_ui/util/my_list_tile.dart'; // Elemento de lista personalizado

// Define la clase HomePage como un StatefulWidget
class HomePage extends StatefulWidget {
  const HomePage({super.key}); // Constructor de la clase HomePage

  @override
  State<HomePage> createState() => _HomePageState(); // Crea el estado de la página principal
}

// Se crea la clase _HomePageState que extiende de State<HomePage>
class _HomePageState extends State<HomePage> {
  // Controlador para el PageView que permite el desplazamiento entre tarjetas
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Define un botón flotante en la parte inferior de la pantalla
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // Acción al presionar el botón flotante (actualmente vacío)
        backgroundColor: Colors.blue, // Color de fondo del botón flotante
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), // Forma circular del botón flotante
        child: const Icon(
          Icons.monetization_on, // Icono de moneda representando finanzas
          size: 30, // Tamaño del icono
          color: Colors.white, // Color del icono
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Posición del botón flotante
      
      // Barra de navegación inferior con iconos de inicio y ajustes
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[50], // Color de fondo de la barra de navegación
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Distribuye los botones equitativamente
          children: [
            // Botón de inicio en la barra de navegación
            IconButton(
              onPressed: () {}, // Acción al presionar el botón de inicio
              icon: Icon(
                Icons.home, // Icono de la casa
                color: Colors.blue[100], // Color del icono
                size: 30, // Tamaño del icono
              ),
            ),
            // Botón de ajustes en la barra de navegación
            IconButton(
              onPressed: () {}, // Acción al presionar el botón de ajustes
              icon: const Icon(
                Icons.settings, // Icono de ajustes
                color: Colors.grey, // Color del icono
                size: 30, // Tamaño del icono
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[50], // Color de fondo de la pantalla
      
      // Cuerpo de la pantalla envuelto en un SafeArea para evitar solapamientos
      body: SafeArea(
        child: Column(
          children: [
            // App bar personalizada con título y botón de agregar
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0), // Margen alrededor del AppBar
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye los elementos equitativamente
                children: [
                  // Título "My Cards"
                  Text(
                    "My Cards", // Texto principal
                    style: GoogleFonts.roboto(
                      fontSize: 26, // Tamaño del texto
                      fontWeight: FontWeight.w600, // Grosor del texto
                    ),
                  ),
                  // Botón circular para agregar una nueva tarjeta
                  Container(
                    padding: const EdgeInsets.all(5.0), // Espaciado dentro del contenedor
                    decoration: const BoxDecoration(
                      color: Colors.blue, // Color de fondo del botón
                      shape: BoxShape.circle, // Forma circular
                    ),
                    child: const Icon(
                      Icons.add, // Icono de suma
                      color: Colors.white, // Color del icono
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 25), // Espaciado vertical

            // Carrusel de tarjetas de crédito
            SizedBox(
              height: 190, // Altura del carrusel
              child: PageView(
                controller: _controller, // Controlador del carrusel
                scrollDirection: Axis.horizontal, // Dirección de desplazamiento horizontal
                children: [
                  // Tarjetas de crédito con diferentes colores y saldos
                  const MyCard(
                    balance: 54.65020, // Saldo de la tarjeta
                    color: Colors.indigo, // Color de la tarjeta
                    expireMonth: 10, // Mes de expiración
                    expireYear: 24, // Año de expiración
                  ),
                  MyCard(
                    balance: 54.65020, // Saldo de la tarjeta
                    color: Colors.blue.shade800, // Color de la tarjeta
                    expireMonth: 10, // Mes de expiración
                    expireYear: 24, // Año de expiración
                  ),
                  MyCard(
                    balance: 54.65020, // Saldo de la tarjeta
                    color: Colors.purple.shade900, // Color de la tarjeta
                    expireMonth: 10, // Mes de expiración
                    expireYear: 24, // Año de expiración
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 15), // Espaciado vertical

            // Indicador de páginas del carrusel
            SmoothPageIndicator(
              controller: _controller, // Controlador del indicador
              count: 3, // Número de páginas
              effect: ExpandingDotsEffect(
                  dotHeight: 8.0, // Altura de los puntos
                  dotColor: const Color.fromARGB(255, 54, 32, 32), // Color de los puntos inactivos
                  activeDotColor: Colors.grey.shade700), // Color del punto activo
            ),

            const SizedBox(height: 25), // Espaciado vertical

            // Botones de acciones principales: Enviar, Pagar y Facturar
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0), // Margen lateral
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribución equitativa
                children: [
                  MyButton(
                    iconPath: "assets/icons/send.png", // Icono de enviar dinero
                    txtButton: "Send", // Texto del botón
                  ),
                  MyButton(
                    iconPath: "assets/icons/pay.png", // Icono de pago
                    txtButton: "Pay", // Texto del botón
                  ),
                  MyButton(
                    iconPath: "assets/icons/bill.png", // Icono de factura
                    txtButton: "Bill", // Texto del botón
                  ),
                ],
              ),
            ),
            
            // Sección de estadísticas y transacciones
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0), // Margen
              child: Column(
                children: [
                  MyListTile(
                    iconPath: "assets/icons/statistics.png", // Icono de estadísticas
                    titleList: "Statistics", // Título de la opción
                    subtitleList: "Payments and Income", // Descripción
                  ),
                  SizedBox(height: 10), // Espaciado vertical
                  MyListTile(
                    titleList: "Transactions", // Título de la opción
                    subtitleList: "Transaction history", // Descripción
                    iconPath: "assets/icons/transaction.png" // Icono de historial
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
