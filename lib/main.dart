import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'my_app.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    var initialSize = const Size(1080, 720);
    var minSize = const Size(720, 480);
    appWindow.size = initialSize;
    appWindow.minSize = minSize;
    appWindow.show();
  });
}
