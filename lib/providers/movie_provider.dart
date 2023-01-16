
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/api.dart';
import '../models/movie.dart';
import '../models/movie_state.dart';
import '../services/movie_service.dart';



final movieProvider = StateNotifierProvider.family<MovieNotifier, MovieState, Categories>((ref, Categories cat)
=> MovieNotifier(
    MovieState(errorMessage: '', isLoad: false,
        upcomingMovies: [],
        topRatedMovies: [],
        popularMovies: [], searchMovies: []
    ),
    cat
)
);

class MovieNotifier extends StateNotifier<MovieState> {
  final Categories category;
  MovieNotifier(super.state, this.category){
    getMovieByCategory();
  }

  Future<void> getMovieByCategory() async {
    if (category == Categories.upcoming) {
      state = state.copyWith(isLoad: true, errorMessage: '');
      final response = await MovieService.getMovieCategory(
          apiPath: Api.upcomingMovies);
      response.fold((l) {
        state = state.copyWith(isLoad: false, errorMessage: l);
      }, (r) {
        state =
            state.copyWith(isLoad: false, errorMessage: '', upcomingMovies: r);
      });
    } else if (category == Categories.popular) {
      state = state.copyWith(isLoad: true, errorMessage: '');
      final response = await MovieService.getMovieCategory(
          apiPath: Api.popularMovies);
      response.fold((l) {
        state = state.copyWith(isLoad: false, errorMessage: l);
      }, (r) {
        state =
            state.copyWith(isLoad: false, errorMessage: '', popularMovies: r);
      });
    }
    else{
      state = state.copyWith(isLoad: true, errorMessage: '');
      final response = await MovieService.getMovieCategory(
          apiPath: Api.topRatedMovies);
      response.fold((l) {
        state = state.copyWith(isLoad: false, errorMessage: l);
      }, (r) {
        state =
            state.copyWith(isLoad: false, errorMessage: '', topRatedMovies: r);
      });
    }

  }


}