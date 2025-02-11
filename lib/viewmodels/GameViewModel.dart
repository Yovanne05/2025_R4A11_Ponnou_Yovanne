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
    notifyListeners();
  }

  void onLongPress(int col, int line){
    CaseModel c = this._mapModel.getCaseModel(col, line);
    this._mapModel.toggleFlag(c);
    notifyListeners();
  }

  Image getIcon(String iconName){
    switch(iconName){
      case("bomb"):
        return Image.asset("assets/bomb.png", height: 40);
      case("case0"):
        return Image.asset("assets/case0.png", height: 40);
      case("case1"):
        return Image.asset("assets/case1.png", height: 40);
      case("case2"):
        return Image.asset("assets/case2.png", height: 40);
      case("case3"):
        return Image.asset("assets/case3.png", height: 40);
      case("case4"):
        return Image.asset("assets/case4.png", height: 40);
      case("case5"):
        return Image.asset("assets/case5.png", height: 40);
      case("case6"):
        return Image.asset("assets/case6.png", height: 40);
      case("case7"):
        return Image.asset("assets/case7.png", height: 40);
      case("case8"):
        return Image.asset("assets/case8.png", height: 40);
      case("eplosion"):
        return Image.asset("assets/explosion.png", height: 40);
      case("flag"):
        return Image.asset("assets/flag.jpg", height: 40);
      default:
        return Image.asset("assets/case0.png", height: 40);
    }
  }

}