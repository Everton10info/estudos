import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_modular/app/modules/colors/light/controllers/light_controller.dart';

class LightPage extends StatefulWidget {
  const LightPage({super.key});

  @override
  State<LightPage> createState() => _LightPageState();
}

final controller = Modular.get<LightController>();

class _LightPageState extends State<LightPage> {
  Color? colorLight = controller.colorList.lightColors[0];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Modular'),
          backgroundColor: colorLight,
        ),
        body: Container(
          color: colorLight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      colorLight = controller.changeLightColor();
                    });
                  },
                  child: const Text('Change Color ?'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Modular.to.pushNamed(
                      '/light/messagePage',
                      arguments: {
                        'message': 'Mensagem recebida!!',
                        'color': colorLight
                      },
                    );
                  },
                  child: const Text('Page next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
