

import '../models/movie.dart';

class MovieState{

  final bool isLoad;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> upcomingMovies;
  final String errorMessage;

  MovieState({
    required this.errorMessage,
    required this.isLoad,
    required this.popularMovies,
    required this.topRatedMovies,
    required this.upcomingMovies
});

  MovieState copyWith({bool? isLoad,String? errorMessage, List<Movie>? popularMovies,List<Movie>? topRatedMovies, List<Movie>? upcomingMovies}){
    return MovieState(
        errorMessage: errorMessage ?? this.errorMessage,
        isLoad: isLoad ?? this.isLoad,
        popularMovies: popularMovies ?? this.popularMovies,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        upcomingMovies: upcomingMovies?? this.upcomingMovies
    );

  }

}

