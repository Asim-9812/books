import 'package:dartz/dartz.dart';

import 'movie.dart';

abstract class MovieInterface{
  Future<Either<String,List<Movie>>> getMovieCategory ({required String apiPath}) ;

}