import 'package:flutter_bloc_practice/movie/data/model.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieError extends MovieState{}

class MovieLoaded extends MovieState {
  final List<MovieModel> movies;

  MovieLoaded(this.movies);
}
