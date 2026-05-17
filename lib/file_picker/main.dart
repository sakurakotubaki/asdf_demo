import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const FilePickerExample(),
    );
  }
}

class FilePickerExample extends StatefulWidget {
  const FilePickerExample({super.key});

  @override
  State<FilePickerExample> createState() => _FilePickerExampleState();
}

class _FilePickerExampleState extends State<FilePickerExample> {
  String? filePath = '';

  Future<void> _fileUpload() async {
    FilePickerResult? result = await FilePicker.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (!mounted || result == null) {
      return;
    }

    setState(() {
      filePath = result.files.first.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('File Picker')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _fileUpload,
              child: const Text('File Picker'),
            ),
            const SizedBox(height: 16),
            Text(filePath ?? 'No file selected'),
          ],
        ),
      ),
    );
  }
}
