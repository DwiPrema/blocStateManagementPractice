import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/movie/bloc/movie_bloc.dart';
import 'package:flutter_bloc_practice/movie/bloc/movie_event.dart';
import 'package:flutter_bloc_practice/movie/bloc/movie_state.dart';

class MovieExplorer extends StatefulWidget {
  const MovieExplorer({super.key});

  @override
  State<MovieExplorer> createState() => _MovieExplorerState();
}

class _MovieExplorerState extends State<MovieExplorer> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieBloc>().add(LoadMovie(["joker"]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return CircularProgressIndicator();
          } else if (state is MovieLoaded) {
            return Image.network(state.movies[0].poster);
          } else {
            return Text("Weelll");
          }
        },
      ),
    );
  }
}
