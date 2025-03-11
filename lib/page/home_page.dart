import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:walletapp_ui/util/my_button.dart';
import 'package:walletapp_ui/util/my_card.dart';
import 'package:walletapp_ui/util/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(
          Icons.monetization_on,
          size: 30,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[50],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                color: Colors.blue[100],
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
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
            // app bar
            Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
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
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                  dotHeight: 8.0,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.grey.shade700),
            ),

            const SizedBox(
              height: 25,
            ),

            // 3 button
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
