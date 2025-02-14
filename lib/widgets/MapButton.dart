import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/GameViewModel.dart';

class MapButton extends StatelessWidget {
  int _col, _line;
  String nameCase;

  MapButton(this._col, this._line, this.nameCase);

  @override
  Widget build(BuildContext context) {
    final gameViewModel = context.watch<GameViewModel>();

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
