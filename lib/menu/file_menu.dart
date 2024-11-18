import 'package:flutter/material.dart';

class FileMenu extends StatefulWidget {
  const FileMenu({super.key});

  @override
  State<FileMenu> createState() => _FileMenuState();
}

class _FileMenuState extends State<FileMenu> {
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      childFocusNode: _buttonFocusNode,
      menuChildren: <Widget>[
        MenuItemButton(
          onPressed: () {},
          child: const Text('New Dart File'),
        ),
        MenuItemButton(
          onPressed: () {},
          child: const Text('Open Dart File'),
        ),
        MenuItemButton(
          onPressed: () {},
          child: const Text('Settings'),
        ),
        MenuItemButton(
          onPressed: () {},
          child: const Text('Save'),
        ),
        MenuItemButton(
          onPressed: () {},
          child: const Text('Save As'),
        ),
        const Divider(
          height: 1,
        ),
        MenuItemButton(
          onPressed: () {},
          child: const Text('Exit'),
        ),
      ],
      builder: (_, MenuController controller, Widget? child) {
        return TextButton(
          focusNode: _buttonFocusNode,
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          }, 
          child: const Text('File'),
        );
      },
    );
  }
}
