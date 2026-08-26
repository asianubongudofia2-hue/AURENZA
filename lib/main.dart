import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AURENZA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
        title: const Text('AURENZA'),
      ),
      body: const Center(
        child: Text('Hello, AURENZA!', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
bash scripts/regenerate-platforms.sh
git add android ios web
git commit -m "chore: add Flutter Android iOS Web platforms"
git push origin main
