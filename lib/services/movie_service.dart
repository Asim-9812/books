
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sampleflutter/domain/i_movie.dart';
import 'package:sampleflutter/domain/movie.dart';
import 'package:sampleflutter/providers/dio_provider.dart';



final movieService = Provider((ref) => MovieService(ref.watch(dioProvider)));


class MovieService implements MovieInterface{

  final Dio dio;
  MovieService(this.dio);

  @override
  Future<Either<String, List<Movie>>> getMovieCategory({required String apiPath}) async{
    try{
      final response = await dio.get(apiPath,queryParameters: {
        'api_key':'bc97f9b071c5fa099126f8472381fb9d'
      });
      final data = (response.data['results'] as  List).map((e) => Movie.fromJson(e)).toList();
      return Right(data);
    }on DioError catch(err){
      return Left(err.message);
    }
  }
}