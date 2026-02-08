import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc_provider/bloc.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Counter myCounter = context.read<Counter>();
    
    return Center(
      child: BlocBuilder(
        bloc: myCounter,
        builder: (context, state) {
          return Text("$state", style: TextStyle(fontSize: 40));
        },
      ),
    );
  }
}
