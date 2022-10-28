import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poc_modular/shared/core/colors.dart';

class DarkController {
  ColorsList colorList;

  DarkController(this.colorList);

  Color? changeDarkColor() {
    var index = Random().nextInt(5);

    return colorList.darkColors[index];
  }
}
