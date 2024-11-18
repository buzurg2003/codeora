// lib/controllers/code_controller.dart
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/dart.dart';

class CodeControllerProvider {
  static CodeController getCodeController() {
    return CodeController(
      text: "void main() {\n    print(\"Hello, world!\");\n}",
      language: dart,
    );
  }
}
