import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends Cubit<int> {
  Counter() : super(0);

  void add() {
    emit(state + 1);
  }

  void remove() {
    emit(state - 1);
  }
}
