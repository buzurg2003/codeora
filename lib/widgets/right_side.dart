import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';

import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:highlight/languages/dart.dart';

class RightSide extends StatefulWidget {
  final String? fileName;

  const RightSide({super.key, this.fileName});

  @override
  State<RightSide> createState() => _RightSideState();
}

class _RightSideState extends State<RightSide> {
  late CodeController _codeController;

  @override
  void initState() {
    super.initState();

    _codeController = CodeController(
      text: widget.fileName != null ? "// Start editing ${widget.fileName}" : "",
      language: dart,
    );
  }

  @override
  void didUpdateWidget(covariant RightSide oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.fileName != oldWidget.fileName) {
      _codeController.text = widget.fileName != null
          ? "// Start editing ${widget.fileName}"
          : "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.fileName == null || widget.fileName!.isEmpty
            ? const Center(
                child: Text(
                  'No file opened',
                  style: TextStyle(color: Colors.white10, fontSize: 18),
                ),
              )
            : CodeTheme(
                data: CodeThemeData(styles: monokaiSublimeTheme),
                child: CodeField(
                  expands: true,
                  controller: _codeController,
                  textStyle: const TextStyle(
                    fontFamily: 'Comic Sans MS',
                    fontSize: 18,
                  ),
                ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }
}
