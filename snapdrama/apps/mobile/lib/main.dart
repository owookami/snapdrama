import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: SnapDramaApp()));
}

class SnapDramaApp extends StatelessWidget {
  const SnapDramaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnapDrama',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B5FBF),
          primary: const Color(0xFF8B5FBF),
          secondary: const Color(0xFFF8BBD0),
          background: const Color(0xFFF5F3F7),
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: const TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: const TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: const TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnapDrama'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('SnapDrama', style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 16),
            Text(
              'K-Drama 회차 요약 숏폼 앱',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: () {}, child: const Text('시작하기')),
          ],
        ),
      ),
    );
  }
}
