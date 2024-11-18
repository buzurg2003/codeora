import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import '../menu/file_menu.dart';

class CustomTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Row(
        children: [
          Expanded(
            child: MoveWindow(
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(
                      "Codeora",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 16),
                    // Add menu buttons
                    FileMenu(),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              // Run Button
              IconButton(
                icon: const Icon(Icons.play_arrow, size: 20),
                onPressed: () {
                  
                },
              ),
              // Save Button
              IconButton(
                icon: const Icon(Icons.save, size: 20),
                onPressed: () {
                  
                },
              ),
              // Window Control Buttons
              MinimizeWindowButton(),
              MaximizeWindowButton(),
              CloseWindowButton(),
            ],
          ),
        ],
      ),
    );
  }
}
