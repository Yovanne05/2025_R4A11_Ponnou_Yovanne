class CaseModel{
  bool _hiden = false;
  bool _hasBomb = false;
  bool _hasExploded = false;
  bool _hasFlag = false;
  int _number = 0;
  int _col;
  int _line;

  CaseModel(this._col, this._line);


  int get col => _col;

  bool get hiden => _hiden;

  bool get hasBomb => _hasBomb;

  int get number => _number;

  bool get hasFlag => _hasFlag;

  bool get hasExploded => _hasExploded;

  set number(int value) {
    _number = value;
  }

  set hasFlag(bool value) {
    _hasFlag = value;
  }

  set hasExploded(bool value) {
    _hasExploded = value;
  }

  set hasBomb(bool value) {
    _hasBomb = value;
  }

  set hiden(bool value) {
    _hiden = value;
  }

  int get line => _line;

  set line(int value) {
    _line = value;
  }

  set col(int value) {
    _col = value;
  }
}