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
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                gameViewModel.generateMap();
              },
              child: Text("Lancer"),
            ),
            SizedBox(height: 20), // espace bouton et grille
            gameViewModel.mapModel.cases.isEmpty
                ? Text('La mine n\'est pas encore générée')
                : Table(
              defaultColumnWidth: FixedColumnWidth(41),
              children: List.generate(
                gameViewModel.mapModel.nbLine,
                    (row) => TableRow(
                  children: List.generate(
                    gameViewModel.mapModel.nbCol,
                        (col) => Padding(
                      padding: EdgeInsets.only(bottom: 1),
                      child: MapButton(
                        col,
                        row,
                        gameViewModel.mapModel.getCaseModel(col, row)?.number.toString() ?? '',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
