import 'dart:math';
import 'package:flutter/material.dart';

import '../../../../../shared/core/colors.dart';

class LightController {
  ColorsList colorList;

  LightController(this.colorList);
  Color? changeLightColor() {
    var index = Random().nextInt(3);

    return colorList.lightColors[index];
  }
}
