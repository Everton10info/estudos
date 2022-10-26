import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/dark_controller.dart';
import 'pages/dark_page.dart';

class DarkModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => DarkController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const DarkPage()),
      ];
}
