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
        return Image.asset("assets/bomb.png");
      case("case0"):
        return Image.asset("assets/case0.png");
      case("case1"):
        return Image.asset("assets/case1.png");
      case("case2"):
        return Image.asset("assets/case2.png");
      case("case3"):
        return Image.asset("assets/case3.png");
      case("case4"):
        return Image.asset("assets/case4.png");
      case("case5"):
        return Image.asset("assets/case5.png");
      case("case6"):
        return Image.asset("assets/case6.png");
      case("case7"):
        return Image.asset("assets/case7.png");
      case("case8"):
        return Image.asset("assets/case8.png");
      case("eplosion"):
        return Image.asset("assets/explosion.png");
      case("flag"):
        return Image.asset("assets/flag.jpg");
      default:
        return Image.asset("assets/case0.png");
    }
  }

}