import 'package:counter_app/models/CaseModel.dart';
import 'package:counter_app/models/MapModel.dart';
import 'package:flutter/cupertino.dart';

class GameViewModel extends ChangeNotifier{

  final MapModel _mapModel = MapModel(10, 8, 7);

  void generateMap() {
    this._mapModel.generateMap();
    notifyListeners();
  }

  void click(int col, int line) {
    CaseModel? c = this._mapModel.getCaseModel(col, line);
    if (c != null) {
      if (!c.hasFlag) {
        if (c.hasBomb) {
          this._mapModel.generateMap();
        } else {
          c.hiden = true;
          this._mapModel.reveal(c);
        }
      }
    }
    notifyListeners();
  }

  void onLongPress(int col, int line) {
    CaseModel? c = this._mapModel.getCaseModel(col, line);
    if (c != null) {
      this._mapModel.toggleFlag(c);
    }
    notifyListeners();
  }


  Image getIcon(String iconName){
    switch(iconName){
      case("bomb"):
        return Image.asset("assets/bomb.png", height: 40);
      case("0"):
        return Image.asset("assets/case0.png", height: 40);
      case("1"):
        return Image.asset("assets/case1.png", height: 40);
      case("2"):
        return Image.asset("assets/case2.png", height: 40);
      case("3"):
        return Image.asset("assets/case3.png", height: 40);
      case("4"):
        return Image.asset("assets/case4.png", height: 40);
      case("5"):
        return Image.asset("assets/case5.png", height: 40);
      case("6"):
        return Image.asset("assets/case6.png", height: 40);
      case("7"):
        return Image.asset("assets/case7.png", height: 40);
      case("8"):
        return Image.asset("assets/case8.png", height: 40);
      case("explosion"):
        return Image.asset("assets/explosion.png", height: 40);
      case("flag"):
        return Image.asset("assets/flag.jpg", height: 40);
      default:
        return Image.asset("assets/case0.png", height: 40);
    }
  }

  MapModel get mapModel => _mapModel;
}