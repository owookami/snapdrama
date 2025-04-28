import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('라이브러리'),
      ),
      body: const Center(
        child: Text('라이브러리 화면'),
      ),
    );
  }
}
