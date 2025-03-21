import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:walletapp_ui/util/my_button.dart';
import 'package:walletapp_ui/util/my_card.dart';
import 'package:walletapp_ui/util/my_list_tile.dart';
// define la clase home page como stateful widget
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
//se creo la clase homepage state que extiende de state
class _HomePageState extends State<HomePage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //boton flotante de sccion principal
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue, 
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(
          Icons.monetization_on, //icono de moneda 
          size: 30,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //barra de navegacion inferior
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[50],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home, // boton del menu inferior , icono de la casa 
                color: Colors.blue[100],
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings, // boton del menu inferior, icono de ajustes  
                color: Colors.grey,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Column(
          children: [
            // app bar personalizada 
            Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                  //app bar
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Cards",
                    style: GoogleFonts.roboto(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  //plus button 
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // carrusel de la tarjeta de credito
            const SizedBox(
              height: 25,
            ),

            // cards
            SizedBox(
              height: 190,
              child: PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: [
                  const MyCard(
                    balance: 54.65020,
                    color: Colors.indigo,
                    expireMonth: 10,
                    expireYear: 24,
                  ),
                  MyCard(
                    balance: 54.65020,
                    color: Colors.blue.shade800,
                    expireMonth: 10,
                    expireYear: 24,
                  ),
                  MyCard(
                    balance: 54.65020,
                    color: Colors.purple.shade900,
                    expireMonth: 10,
                    expireYear: 24,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            //indicador de paginas
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                  dotHeight: 8.0,
                  dotColor: const Color.fromARGB(255, 54, 32, 32),
                  activeDotColor: Colors.grey.shade700),
            ),

            const SizedBox(
              height: 25,
            ),

            // 3 button
            //botones de acciones principales para enviar, pagar y facturar y el boton de bill
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    iconPath: "assets/icons/send.png",
                    txtButton: "Send",
                  ),
                  MyButton(
                    iconPath: "assets/icons/pay.png",
                    txtButton: "Pay",
                  ),
                  MyButton(
                    iconPath: "assets/icons/bill.png",
                    txtButton: "Bill",
                  ),
                ],
              ),
            ),

            // stats column
            //columna de estadisticas y transacciones o seccion de estadisticas y transacciones
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
              child: Column(
                children: [
                  MyListTile(
                    iconPath: "assets/icons/statistics.png",
                    titleList: "Statistics",
                    subtitleList: "Payments and Income",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyListTile(
                      titleList: "Transactions",
                      subtitleList: "Transaction history",
                      iconPath: "assets/icons/transaction.png"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
