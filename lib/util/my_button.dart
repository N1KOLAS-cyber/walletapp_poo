import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String iconPath;
  final String txtButton;

  const MyButton({super.key, required this.iconPath, required this.txtButton});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1.0,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
          child: Image.asset(iconPath),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          txtButton,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
