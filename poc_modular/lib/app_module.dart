import 'package:flutter_modular/flutter_modular.dart';

import 'app/modules/color_modules/dark/dark_module.dart';
import 'app/modules/color_modules/light/light_module.dart';
import 'app/modules/home/home_module.dart';
import 'shared/core/colors.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [Bind.factory((i) => ColorsList())];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/dark', module: DarkModule()),
        ModuleRoute('/light', module: LightModule()),
      ];
}
