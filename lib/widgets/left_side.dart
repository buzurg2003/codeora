import 'package:flutter/material.dart';

class LeftSide extends StatefulWidget {
  final Function(String fileName) onFileSelected;

  const LeftSide({super.key, required this.onFileSelected});

  @override
  State<LeftSide> createState() => _LeftSideState();
}

class _LeftSideState extends State<LeftSide> {
  List<String> files = [];
  TextEditingController _editingController = TextEditingController();
  int? _editingIndex;
  int? selectedIndex; // Track the selected file index

  // Method to show AlertDialog for adding a new file
  void showAddFileDialog() {
    TextEditingController newFileController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter File Name'),
          content: TextField(
            controller: newFileController,
            decoration: const InputDecoration(hintText: 'File Name'),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog without adding
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String fileName = newFileController.text.trim();
                if (fileName.isNotEmpty) {
                  setState(() {
                    files.add(fileName);
                  });
                }
                Navigator.pop(context); // Close the dialog after adding
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void startEditing(int index) {
    setState(() {
      _editingIndex = index;
      _editingController.text = files[index];
    });
  }

  void saveFileName() {
    if (_editingIndex != null) {
      setState(() {
        files[_editingIndex!] = _editingController.text;
        _editingIndex = null;
      });
    }
  }

  void selectFile(int index) {
    widget.onFileSelected(files[index]);
    setState(() {
      selectedIndex = index;  // Update selected file index
    });
  }

  void deleteFile(int index) {
    widget.onFileSelected(files[index]);
    setState(() {
      if (_editingIndex == index) {
        _editingIndex = null;
      }
      // Notify parent if the selected file is deleted
      if (files[index] == widget.onFileSelected.toString()) {
        widget.onFileSelected(""); // Reset the selection in RightSide
      }
      files.removeAt(index);

      // Reset selected index if the deleted file was selected
      if (selectedIndex == index) {
        selectedIndex = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Column(
        children: [
          Container(
            height: 40,
            color: Colors.black12,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Project',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: showAddFileDialog, // Show dialog when clicked
                  icon: Image.asset(
                    'lib/img/new_file.png',
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                // Highlight selected file
                bool isSelected = selectedIndex == index;
                return ListTile(
                  leading: Image.asset(
                    'lib/img/dart_icon.png',
                    height: 16,
                    width: 16,
                  ),
                  title: _editingIndex == index
                      ? TextField(
                          controller: _editingController,
                          onSubmitted: (_) => saveFileName(),
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: 'Edit File Name',
                            isDense: true,
                          ),
                        )
                      : GestureDetector(
                          onTap: () => selectFile(index),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal, // Make the text scrollable
                            child: Text(files[index]),
                          ),
                        ),
                  tileColor: isSelected ? Colors.blue.withOpacity(0.1) : null,  // Highlight selected file
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_editingIndex == index)
                        IconButton(
                          icon: const Icon(Icons.save, size: 17),
                          onPressed: saveFileName,
                        )
                      else
                        IconButton(
                          icon: const Icon(Icons.edit, size: 17),
                          onPressed: () => startEditing(index),
                        ),
                      IconButton(
                        icon: const Icon(Icons.delete, size: 17),
                        onPressed: () => deleteFile(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }
}
