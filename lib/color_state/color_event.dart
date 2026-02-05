import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent {toAmber, toLightBlue, toRed}

class ColorBloc {
  Color _color = Colors.amber;

  final StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  final StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateController.sink;

  Stream<Color> get stateStream => _stateController.stream;

  void _mapEventToState(ColorEvent eventColor) {
    if (eventColor == ColorEvent.toAmber) {
      _color = Colors.amber;
    } else
    if (eventColor == ColorEvent.toLightBlue) {
      _color = Colors.lightBlue;
    } else {
      _color = Colors.red;
    }

    _stateSink.add(_color);
  }

  ColorBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
