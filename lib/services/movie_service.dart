
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
// import 'package:sampleflutter/models/i_movie.dart';
import 'package:sampleflutter/models/movie.dart';
// import 'package:sampleflutter/providers/movie_provider.dart';



class MovieService {

  static final dio = Dio();
  static  Future<Either<String, List<Movie>>> getMovieCategory({required String apiPath}) async {

    try{
      final response  = await dio.get(apiPath, queryParameters: {
        'api_key': 'bc97f9b071c5fa099126f8472381fb9d'
      });
      final data = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
      return Right(data);
    }on DioError catch(err){
      return Left(err.message);
    }
  }


}



