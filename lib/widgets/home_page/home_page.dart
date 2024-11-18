import 'package:flutter/material.dart';

import 'package:bitsdojo_window/bitsdojo_window.dart';

import '../custom_title_bar.dart';
import '../left_side.dart';
import '../right_side.dart';

var borderColor = Colors.black12;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedFile;
  String? selectedFolder;

  void handleFileSelection(String fileName) {
    setState(() {
      selectedFile = fileName;
    });
  }

  void handleFolderSelection(String folderName) {
    setState(() {
      selectedFolder = folderName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: borderColor,
        child: Column(
          children: [
            CustomTitleBar(),
            Expanded(
              child: Row(
                children: [
                  LeftSide(
                    onFileSelected: handleFileSelection,
                  ),
                  RightSide(fileName: selectedFile),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
