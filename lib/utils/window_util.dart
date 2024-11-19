// lib/utils/window_util.dart
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/widgets.dart';

void setupWindow() {
  var initialSize = const Size(1080, 720);
  var minSize = const Size(720, 480);
  appWindow.size = initialSize;
  appWindow.minSize = minSize;
  appWindow.alignment = Alignment.center;
  appWindow.show();
}
