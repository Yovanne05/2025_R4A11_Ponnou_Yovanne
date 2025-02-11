import 'dart:math';

import 'package:counter_app/models/CaseModel.dart';

class MapModel {
  int _nbLine, _nbCol, _nbBomb;
  List<List<CaseModel>> _cases = List<List<CaseModel>>.empty();

  MapModel(this._nbLine, this._nbCol, this._nbBomb);

  /*
  méthode qui permet d’initialiser les cases de la grille du jeu
   */
  void initCases() {
    this._cases = List<List<CaseModel>>.generate(this._nbCol,
        (i) => List<CaseModel>.generate(this._nbLine, (j) => CaseModel()));
  }

  /*
  méthode qui initialise l’emplacement des bombes dans les cases
de la grille
   */
  void initBomb() {
    for (int i = 0; i < this._nbBomb; i++) {
      int line = Random().nextInt(this._nbLine);
      int col = Random().nextInt(this._nbCol);
      this._cases[line][col].hasBomb = true;
    }
  }
}
