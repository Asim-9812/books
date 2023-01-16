

import 'movie.dart';



class MovieState{

  final bool isLoad;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> upcomingMovies;
  final List<Movie> searchMovies;
  final String errorMessage;

  MovieState({
    required this.errorMessage,
    required this.isLoad,
    required this.popularMovies,
    required this.topRatedMovies,
    required this.upcomingMovies,
    required this.searchMovies
  });

  MovieState copyWith({
    bool? isLoad,
    String? errorMessage,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? upcomingMovies,
    List<Movie>? searchMovies
  }) {
    return MovieState(
        errorMessage: errorMessage ??  this.errorMessage,
        isLoad: isLoad ?? this.isLoad,
        popularMovies: popularMovies ?? this.popularMovies,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        upcomingMovies: upcomingMovies ?? this.upcomingMovies,
        searchMovies: searchMovies ?? this.searchMovies
    );
  }



}
