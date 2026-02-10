class MovieModel {
  String title;
  String year;
  String poster;

  MovieModel({required this.title, required this.year, required this.poster});

  factory MovieModel.create(Map<String, dynamic> obj) {
    final posterValue = obj["Poster"];
    final poster = posterValue != null && posterValue != "N/A"
        ? posterValue
        : "";

    return MovieModel(title: obj["Title"], year: obj["Year"], poster: poster);
  }
}
