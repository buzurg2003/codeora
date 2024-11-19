import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'my_app.dart';
import 'utils/window_util.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    setupWindow();
  });
}
