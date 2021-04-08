import 'dart:async';

class CounterBloc {
  int counter;

  CounterBloc({this.counter = 0});

  final _stateStreamController = StreamController<int>();

  StreamSink<int> get _counterBlocSink => _stateStreamController.sink;
  Stream<int> get counterBlocStream => _stateStreamController.stream;

  void incrementCounter() {
    counter++;
    _counterBlocSink.add(counter);
  }

  void decrementCounter() {
    counter--;
    _counterBlocSink.add(counter);
  }

  void dispose() {
    _stateStreamController.close();
  }
}
