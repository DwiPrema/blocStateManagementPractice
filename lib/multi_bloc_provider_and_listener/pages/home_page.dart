import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/multi_bloc_provider_and_listener/bloc/counter.dart';
import 'package:flutter_bloc_practice/multi_bloc_provider_and_listener/bloc/theme.dart';

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
            MultiBlocListener(
              listeners: [
                BlocListener<ThemeBloc, bool>(
                  listener: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Tema Gelap Aktif"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  listenWhen: (previous, current) {
                    if (current == false) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                ),
                BlocListener<Counter, int>(
                  listener: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("data diatas 10"),
                        duration: Duration(milliseconds: 700),
                      ),
                    );
                  },
                  listenWhen: (previous, current) {
                    if (current > 10) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                ),
              ],
              child: Container(),
            ),

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
