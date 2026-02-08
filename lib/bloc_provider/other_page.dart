import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc_provider/bloc.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter mycounter = context.read<Counter>();

    return Scaffold(
      body: Center(
        child: BlocBuilder(
          bloc: mycounter,
          builder: (context, state) {
            return Text("$state", style: TextStyle(fontSize: 30));
          },
        ),
      ),
    );
  }
}
