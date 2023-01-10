import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/services/movie_service.dart';

import '../api.dart';
import '../domain/i_movie.dart';
import 'movie_state.dart';

final movieProvider= StateNotifierProvider<MovieNotifier,MovieState>((ref) => MovieNotifier(
    MovieState(errorMessage: '', isLoad: false, movies: []),
    ref.watch(movieService)));


class MovieNotifier extends StateNotifier<MovieState>{
  final MovieInterface movieInterface;

  MovieNotifier(super.state,this.movieInterface){
    getMovieByCategory(apiPath: Api.popularMovies);
  }


  Future<void> getMovieByCategory ({required String apiPath}) async {
    state = state.copyWith(isLoad: true, errorMessage: '');
    final response = await movieInterface.getMovieCategory(apiPath: apiPath);

    response.fold(
        (l){
          state=state.copyWith(isLoad: false, errorMessage: l);
        },
          (r){
          state=state.copyWith(isLoad: false, movies: r);
          }
    );

  }




}