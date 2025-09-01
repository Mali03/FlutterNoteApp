import 'package:flutter/material.dart';

class NewNoteView extends StatefulWidget {
  const NewNoteView({super.key});

  @override
  State<NewNoteView> createState() => _NewNoteViewState();
}

class _NewNoteViewState extends State<NewNoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Not Oluştur"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Text("Yeni not"),
    );
  }
}
