import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/pages/home_page.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 80),
          child: Lottie.asset(
            'lib/images/lottie1.json',
          ),
          //child: Image.asset('lib/images/avacado.png'),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            "We deliver groceries at your doorstep",
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSerif(
                fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          "Fresh items everyday",
          style: TextStyle(color: Colors.grey[600]),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              )),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(18),
            child: const Text(
              "Get started",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Spacer()
      ],
    ));
  }
}
