import 'package:flutter/material.dart';

class DramaDetailScreen extends StatelessWidget {
  final String dramaId;

  const DramaDetailScreen({
    required this.dramaId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('드라마 상세'),
      ),
      body: Center(
        child: Text('드라마 상세 화면: $dramaId'),
      ),
    );
  }
}
