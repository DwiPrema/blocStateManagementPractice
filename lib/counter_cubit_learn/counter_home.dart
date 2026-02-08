import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/counter_cubit_learn/counter_cubit.dart';

class CounterCubitHome extends StatelessWidget {
  const CounterCubitHome({super.key});

  @override
  Widget build(BuildContext context) {
    CounterCubit myCounter = CounterCubit();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocListener(
            bloc: myCounter,
            listener: (context, state) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("well"), showCloseIcon: true,));
            },
            child: BlocBuilder(
              bloc: myCounter,
              builder: (context, state) {
                return Text(state.toString(), style: TextStyle(fontSize: 50));
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  myCounter.decrement();
                },
                child: Icon(Icons.remove, size: 20),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  myCounter.increment();
                },
                child: Icon(Icons.add, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
