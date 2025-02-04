class CounterModel {
  int _counter = 0;

  void incrementCounter() {
    _counter++;
  }

  void decrementCounter() {
    _counter--;
  }

  int get counter => _counter;
}
