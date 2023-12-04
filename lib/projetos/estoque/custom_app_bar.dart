import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final int count;
  CustomAppBar({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 96,
      color: Color(0xFF0A2430),
      child: Column(
        children: [
          Container(
            height: 48,
            // color: Colors.amberAccent,
            child: Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  // color: Colors.cyan,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/menu');
                    },
                    child: Icon(Icons.close, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 48,
                      // color: Colors.blueGrey,
                      alignment: Alignment.center, // Adicione esta linha
                      child: Text(
                        "Estoque",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  height: 48,
                  width: 48,
                  // color: Colors.cyan,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/finalizar');
                    },
                    child: Icon(Icons.check, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 48,
            // color: Colors.deepOrange,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      height: 24,
                      // color: Colors.brown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              "29/11/2023",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: GoogleFonts.poppins().fontFamily),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 21),
                            child: Text(
                              "total",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: GoogleFonts.poppins().fontFamily),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      height: 24,
                      // color: Colors.blue,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                child: Text(
                                  "NOME ",
                                  style: TextStyle(
                                      color: Color(0xFF27F3ED),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              padding: const EdgeInsets.only(right: 16),
                              child: Text(
                                "ENDEREÇO ",
                                style: TextStyle(
                                    color: Color(0xFF27F3ED),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Text(
                                  "TELEFONE ",
                                  style: TextStyle(
                                      color: Color(0xFF27F3ED),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 20),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    count.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _save() {
    print("salve");
  }
}
