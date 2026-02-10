import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/movie/bloc/movie_event.dart';
import 'package:flutter_bloc_practice/movie/bloc/movie_state.dart';
import 'package:flutter_bloc_practice/movie/data/model.dart';
import 'package:flutter_bloc_practice/movie/data/services.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<LoadMovie>((event, emit) async {
      emit(MovieLoading());

      try {
        final List<MovieModel> loadedMovie = [];

        for (final keyword in event.keywords) {
          final result = await MovieService.searchMovie(keyword.toString());

          if (result.isEmpty) continue;

          final movie = result.firstWhere(
            (m) => m.poster.isNotEmpty,
            orElse: () => result.first,
          );

          loadedMovie.add(movie);
        }

        emit(MovieLoaded(loadedMovie));
        
      } catch (e) {
        print(e);
      }
    });
  }
}
