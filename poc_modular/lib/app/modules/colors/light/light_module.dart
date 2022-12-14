import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/light_controller.dart';
import 'pages/message_page.dart';
import 'pages/light_page.dart';

class LightModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => LightController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LightPage()),
        ChildRoute('/messagePage',
            child: (context, args) => MessagePage(
                  message: args.data['message'],
                  color: args.data['color'],
                )),
      ];
}
