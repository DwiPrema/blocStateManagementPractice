import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc_provider/bloc.dart';
import 'package:flutter_bloc_practice/bloc_provider/home.dart';
import 'package:flutter_bloc_practice/color_state/color_home.dart';
import 'package:flutter_bloc_practice/counter_cubit_learn/counter_home.dart';
import 'package:flutter_bloc_practice/counter_state_bloc_consumer/counter_home.dart';
import 'package:flutter_bloc_practice/movie/bloc/movie_bloc.dart';
import 'package:flutter_bloc_practice/movie/presentation/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// void main() {
//   runApp(const MyApp());
// }

// Future<void> main() async {
//   // 2. LOAD filenya di sini! (Ini yang bikin error kalau lupa)
//   await dotenv.load(fileName: ".env");

//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(),
      child: MaterialApp(home: MovieExplorer()),
    );

    //USE BLOC PROVIDER
    // return BlocProvider(
    //   create: (context) => Counter(),
    //   child: MaterialApp(home: MovieExplorer()),
    // );

    //USE CUBIT
    // return MaterialApp(home: CounterCubitHome());

    //USE BLOC CONSUMER
    // return MaterialApp(home: CounterBlocConsumer());

    //USE CUBIT FOR COLORHOME PAGE
    // return MaterialApp(home: ColorHome());
  }
}
