import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/counter_cubit_learn/counter_cubit.dart';

class CounterHome extends StatelessWidget {
  const CounterHome({super.key});

  @override
  Widget build(BuildContext context) {
    CounterCubit myCounter = CounterCubit();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<int>(
            initialData: 0,
            stream: myCounter.stream,
            builder: (context, snapshot) {
              return Text(
                snapshot.data.toString(),
                style: TextStyle(fontSize: 50),
              );
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  myCounter.decrement();
                },
                child: Icon(Icons.minimize, size: 20),
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
