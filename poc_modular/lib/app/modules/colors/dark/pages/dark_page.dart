import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_modular/app/modules/colors/dark/controllers/dark_controller.dart';

class DarkPage extends StatefulWidget {
  const DarkPage({super.key});

  @override
  State<DarkPage> createState() => _DarkPageState();
}

final controller = Modular.get<DarkController>();
Color? colorDark = controller.colorList.darkColors[0];

class _DarkPageState extends State<DarkPage> {
  int indexColor = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 50,
          title: const Text('Modular'),
          backgroundColor: colorDark,
        ),
        body: Container(
          color: colorDark,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      colorDark = controller.changeDarkColor();
                    });
                  },
                  child: const Text('Change Color'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
