import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:treinamento/components/custom_button.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Button(
                text: "Estoque",
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                }),
            SizedBox(
              height: 10,
            ),
            Button(
                text: "Chassi",
                onPressed: () {
                  Navigator.pushNamed(context, "/chassi");
                }),
          ],
        ),
      ),
    );
  }
}
