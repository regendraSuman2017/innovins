import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterTextLogin extends StatelessWidget {
  const EnterTextLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return enterYourMobileText();
  }
}

enterYourMobileText() {
  return Text(
    'Welcome Back to  \nour grocery shop',
    style: GoogleFonts.lato(
      fontWeight: FontWeight.w900,
      fontSize: Get.height * 0.035,
      color: const Color(0xFF000000),
    ),
  );
}