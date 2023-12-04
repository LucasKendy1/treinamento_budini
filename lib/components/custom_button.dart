import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF2D3442),
            width: 2.0, // Ajuste a largura da borda conforme necessário
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Color(0xFF2D3442),
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
