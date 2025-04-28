import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  final String summaryId;

  const PlayerScreen({
    required this.summaryId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('영상 플레이어'),
      ),
      body: Center(
        child: Text('영상 플레이어 화면: $summaryId'),
      ),
    );
  }
}
