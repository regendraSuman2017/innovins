import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterYourMobileText extends StatelessWidget {
  const EnterYourMobileText({super.key});

  @override
  Widget build(BuildContext context) {
    return enterYourMobileText();
  }
}

enterYourMobileText() {
  return Text(
    'Welcome to our \nGrocery shop',
    style: GoogleFonts.lato(
      fontWeight: FontWeight.w900,
      fontSize: Get.height * 0.035,
      color: const Color(0xFF000000),
    ),
  );
}