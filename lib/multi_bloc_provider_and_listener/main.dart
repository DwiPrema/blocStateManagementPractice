import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/multi_bloc_provider_and_listener/bloc/counter.dart';
import 'package:flutter_bloc_practice/multi_bloc_provider_and_listener/bloc/theme.dart';
import 'package:flutter_bloc_practice/multi_bloc_provider_and_listener/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeBloc myTheme = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => myTheme,
    //   child: BlocBuilder<ThemeBloc, bool>(
    //     bloc: myTheme,
    //     builder: (context, state) {
    //       return MaterialApp(
    //         theme: state == true ? ThemeData.light() : ThemeData.dark(),
    //         home: BlocProvider(
    //           create: (context) => Counter(),
    //           child: HomePage(),
    //         ),
    //       );
    //     },
    //   ),
    // );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Counter()),
        BlocProvider(create: (context) => myTheme),
      ],
      child: BlocBuilder<ThemeBloc, bool>(
        bloc: myTheme,
        builder: (context, state) {
          return MaterialApp(
            theme: state == true ? ThemeData.light() : ThemeData.dark(),
            home: HomePage(),
          );
        },
      ),
    );
  }
}
