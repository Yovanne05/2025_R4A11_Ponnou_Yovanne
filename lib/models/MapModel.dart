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
        (i) => List<CaseModel>.generate(this._nbLine, (j) => CaseModel(i, j)));
  }

  /*
  méthode qui initialise l’emplacement des bombes dans les cases
de la grille
   */
  void initBomb() {
    Random random = Random();
    int bombCount = 0;

    while (bombCount < this._nbBomb) {
      int line = random.nextInt(this._nbLine);
      int col = random.nextInt(this._nbCol);

      if (!_bombePresente(col, line)) {
        this._cases[col][line].hasBomb = true;
        bombCount++;
      }
    }
  }

/*
 * verif bombe autour ou dans case
 */
  bool _bombePresente(int col, int line) {
    List<List<int>> directions = [
      [-1, -1], [-1, 0], [-1, 1], // haut gauche, haut, haut droite
      [0, -1], [0, 1], // gauche, droite
      [1, -1], [1, 0], [1, 1] // bas gauche, bas, bas droite
    ];

    // veirf case actuelle et voisin
    for (var dir in directions) {
      int newLine = line + dir[0];
      int newCol = col + dir[1];

      if (_tryGetCase(newCol, newLine) && _cases[newCol][newLine].hasBomb) {
        return true;
      }
    }

    return false;
  }

  /*
  méthode qui permet d’affecter des chiffres aux cases
   */
  void initNumbers() {
    for (int col = 0; col < this._cases.length; col++) {
      for (int line = 0; line < this._cases[col].length; line++) {
        this._cases[col][line].number = this._computeNumber(col, line);
      }
    }
  }

  /*
  permet de calculer le nombre de bombes qu’il y a
autour d’une case
   */
  int _computeNumber(int col, int line) {
    int nombreBombeAutour = 0;

    List<List<int>> directions = [
      [-1, -1], [-1, 0], [-1, 1], // haut gauche, haut, haut droite
      [0, -1], [0, 1], // gauche, droite
      [1, -1], [1, 0], [1, 1] // bas gauche, bas, bas droite
    ];

    for (var dir in directions) {
      if (_trygetCaseAndHaveBomb(col + dir[0], line + dir[1])) {
        nombreBombeAutour++;
      }
    }

    return nombreBombeAutour;
  }

  /*
  fonction qui retourne un bool si la case existe et à une bombe
   */
  bool _trygetCaseAndHaveBomb(int col, int line) {
    return this._tryGetCase(col, line) && this._haveBombe(col, line);
  }

  /*
  renvoie un bool afin de savoir si la case contient une bombe
   */
  bool _haveBombe(int col, int line) {
    return this._cases[col][line].hasBomb;
  }

  /*
  permet de récupérer une case si elle existe
   */
  bool _tryGetCase(int col, int line) {
    return col >= 0 && col < _nbCol && line >= 0 && line < _nbLine;
  }

  /*
  méthode qui génère l’entièreté des cases et leur contenu
   */
  void generateMap() {
    this.initCases();
    this.initBomb();
    this.initNumbers();
  }

/*
  méthode qui permet de dévoiler une case
*/
  void reveal(CaseModel c) {
    c.hiden = true;
    if (c.number == 0) {
      _revealAround(c);
    }
  }

  /*
  méthode qui révèle les case autour d'une case révélé
  */
  void _revealAround(CaseModel c) {
    List<List<int>> directions = [
      [-1, -1], [-1, 0], [-1, 1], // haut gauche, haut, haut droite
      [0, -1], [0, 1], // gauche, droite
      [1, -1], [1, 0], [1, 1] // bas gauche, bas, bas droite
    ];

    List<CaseModel> listesCases = [c];

    while (listesCases.isNotEmpty) {
      CaseModel currentCase = listesCases.removeLast();

      for (var dir in directions) {
        int newCol = currentCase.col + dir[0];
        int newLine = currentCase.line + dir[1];

        if (_tryGetCase(newCol, newLine)) {
          CaseModel caseModel = _cases[newCol][newLine];

          if (!caseModel.hiden && !caseModel.hasBomb) {
            caseModel.hiden = true;

            if (caseModel.number == 0) {
              listesCases.add(caseModel);
            }
          }
        }
      }
    }
  }

  /*
  méthode qui permet de dévoiler toutes les cases de la grille.
   */
  void revealAll() {
    for (List<CaseModel> listeCases in this._cases) {
      for (CaseModel c in listeCases) {
        reveal(c);
      }
    }
  }

  /*
  méthode qui permet de déclencher une explosion dans une case
   */
  void explode(CaseModel c) {
    if (c.hasBomb) {
      c.hasExploded = true;
    }
  }

  /*
   permet de définir l’état du drapeau
   */
  void toggleFlag(CaseModel c) {
    bool ancienstatut = c.hasFlag;
    c.hasFlag = !ancienstatut;
  }

  List<List<CaseModel>> get cases => _cases;

  get nbBomb => _nbBomb;

  get nbCol => _nbCol;

  int get nbLine => _nbLine;

  CaseModel? getCaseModel(int col, int line) {
    if (_tryGetCase(col, line)) {
      return _cases[col][line];
    }
    return null;
  }

  set cases(List<List<CaseModel>> value) {
    _cases = value;
  }

  set nbBomb(value) {
    _nbBomb = value;
  }

  set nbCol(value) {
    _nbCol = value;
  }

  set nbLine(int value) {
    _nbLine = value;
  }
}
