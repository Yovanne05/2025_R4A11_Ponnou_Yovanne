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

  /*
  méthode qui permet d’affecter des chiffres aux cases
   */
  void initNumbers() {
    int cptCases = 0;
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
  int _computeNumber(int col, int line){
    int nombreBombeAutour = 0;

    bool haut = this._trygetCaseAndHaveBomb(col++, line);
    bool hautDroite = this._trygetCaseAndHaveBomb(col++, line++);
    bool droite = this._trygetCaseAndHaveBomb(col, line++);
    bool Basdroite = this._trygetCaseAndHaveBomb(--col, line++);
    bool bas = this._trygetCaseAndHaveBomb(--col, line);
    bool basGauche = this._trygetCaseAndHaveBomb(--col, line--);
    bool gauche = this._trygetCaseAndHaveBomb(col, line--);
    bool Hautgauche = this._trygetCaseAndHaveBomb(col++, line--);

    List<bool> listesCoinsBombCase = [
      haut,
      hautDroite,
      droite,
      Basdroite,
      bas,
      basGauche,
      gauche,
      Hautgauche
    ];

    for(bool caseExistAndhasBomb in listesCoinsBombCase){
      if(caseExistAndhasBomb){
        nombreBombeAutour++;
      }
    }
    return nombreBombeAutour;
  }

  /*
  fonction qui retourne un bool si la case existe et à une bombe
   */
  bool _trygetCaseAndHaveBomb(int col, int line){
    CaseModel c = this._cases[col][line];
    return this._tryGetCase(c) && this._haveBombe(c);
  }

  /*
  renvoie un bool afin de savoir si la case contient une bombe
   */
  bool _haveBombe(CaseModel c){
    return c.hasBomb;
  }
  /*
  permet de récupérer une case si elle existe
   */
  bool _tryGetCase(CaseModel c){
    return true;
  }
}
