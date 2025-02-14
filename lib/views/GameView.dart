import 'package:counter_app/widgets/MapButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/GameViewModel.dart';

class GameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameViewModel = context.watch<GameViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Démineur"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              gameViewModel.generateMap();
            },
            child: Text("Commencer le jeu"),
          ),
          Expanded(
            child: gameViewModel.mapModel.cases.isEmpty
                ? Center(child: Text('La mine n\'est pas encore générée'))
                : Table(
              children: List.generate(
                gameViewModel.mapModel.nbLine,
                    (row) => TableRow(
                  children: List.generate(
                    gameViewModel.mapModel.nbCol,
                        (col) => MapButton(
                      col,
                      row,
                      gameViewModel.mapModel.getCaseModel(col, row)?.toString() ?? '',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
