import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc_provider/bloc.dart';
import 'package:flutter_bloc_practice/bloc_provider/data_widget.dart';
import 'package:flutter_bloc_practice/bloc_provider/other_page.dart';

class HomeBlocProvider extends StatelessWidget {
  const HomeBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    Counter myCounter = context.read<Counter>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => OtherPage()));
        },
        child: Icon(Icons.arrow_forward),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DataWidget(),

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
