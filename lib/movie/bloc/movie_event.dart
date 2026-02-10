abstract class MovieEvent {}

class LoadMovie extends MovieEvent {
  final List<String> keywords;

  LoadMovie(this.keywords);
}
