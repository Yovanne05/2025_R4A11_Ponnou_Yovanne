import 'package:counter_app/models/CaseModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/GameViewModel.dart';

class MapButton extends StatelessWidget {
  int _col, _line;

  MapButton(this._col, this._line);

  @override
  Widget build(BuildContext context) {
    final gameViewModel = context.watch<GameViewModel>();
    CaseModel? caseModel = gameViewModel.mapModel.getCaseModel(_col, _line);

    String nameCase = '0';

    if (caseModel != null) {
      if (caseModel.hasBomb) {
        nameCase = 'bomb';
      } else if (caseModel.number > 0) {
        nameCase = caseModel.number.toString();
      } else if (caseModel.hiden) {
        nameCase = '0';
      } else if (caseModel.hasFlag) {
        nameCase = 'flag';
      }
    }

    return InkWell(
      onTap: () {
        gameViewModel.click(_col, _line);
      },
      onLongPress: () {
        gameViewModel.onLongPress(_col, _line);
      },
      child: Container(
        child: gameViewModel.getIcon(nameCase),
      ),
    );
  }
}
