

import '../domain/movie.dart';

class MovieState{

  final bool isLoad;
  final List<Movie> movies;
  final String errorMessage;

  MovieState({
    required this.errorMessage,
    required this.isLoad,
    required this.movies
});

  MovieState copyWith({bool? isLoad,String? errorMessage, List<Movie>? movies}){
    return MovieState(
        errorMessage: errorMessage ?? this.errorMessage,
        isLoad: isLoad ?? this.isLoad,
        movies: movies ?? this.movies);

  }

}

