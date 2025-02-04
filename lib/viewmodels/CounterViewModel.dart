import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../models/CounterModel.dart';

class CounterViewModel extends ChangeNotifier{
  CounterModel _counterModel = CounterModel();

  void incremente(){
    _counterModel.incrementCounter();
    notifyListeners();
  }

  void decremente(){
    _counterModel.decrementCounter();
    notifyListeners();
  }

  int get counter => _counterModel.counter;
}