import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/GameViewModel.dart';
import 'views/GameView.dart'; // Importation de GameView

const Color primaryColor = Color(0xFF2196F3);
const String appTitle = 'Démineur';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: GameView(),
    );
  }
}
