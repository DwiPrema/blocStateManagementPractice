import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/multi_bloc_provider/bloc/counter.dart';
import 'package:flutter_bloc_practice/multi_bloc_provider/bloc/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter myCounter = context.read<Counter>();
    ThemeBloc themeBloc = context.read<ThemeBloc>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          themeBloc.changeTheme();
        },
      ),
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<Counter, int>(
              bloc: myCounter,
              builder: (context, state) {
                return Text("$state", style: TextStyle(fontSize: 50));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    myCounter.remove();
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    myCounter.add();
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
