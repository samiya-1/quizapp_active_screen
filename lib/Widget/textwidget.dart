import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidgetStyle extends StatelessWidget{
  const TextWidgetStyle({super.key, this.textcontent});
 final   textcontent;
  @override
  Widget build(BuildContext context) {
   return Text(
              textcontent,
              style: GoogleFonts.lato(color: const Color.fromARGB(255, 178, 136, 233),
                fontSize: 24,)
              
            );
  }
}