import 'package:counter_app/models/CaseModel.dart';
import 'package:counter_app/models/MapModel.dart';
import 'package:flutter/cupertino.dart';

class GameViewModel extends ChangeNotifier{
  MapModel _mapModel = MapModel(10, 8, 7);

  void generateMap(){
    this._mapModel.generateMap();
    notifyListeners();
  }

  void click(int col, int line){
    CaseModel c = this._mapModel.getCaseModel(col, line);
    if(!c.hasFlag){
      if(c.hasBomb){
        c.hasExploded=true;
        this._mapModel.revealAll();
      }else{
        c.hiden=true;
        this._mapModel.reveal(c);
      }
    }
  }

}