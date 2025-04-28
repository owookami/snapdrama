import 'package:flutter/material.dart';

class EpisodeDetailScreen extends StatelessWidget {
  final String episodeId;

  const EpisodeDetailScreen({
    required this.episodeId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('에피소드 상세'),
      ),
      body: Center(
        child: Text('에피소드 상세 화면: $episodeId'),
      ),
    );
  }
}
