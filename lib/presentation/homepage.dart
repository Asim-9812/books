import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/movie_notifier.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer(
            builder: (context, ref,child) {
              final movieData = ref.watch(movieProvider);
              if (movieData.isLoad){
                return CircularProgressIndicator();
              }
              else if (movieData.errorMessage.isNotEmpty){
                return Text(movieData.errorMessage);
              }
              else{
                return Column(
                  children: [
                    Text(movieData.movies[0].title),
                    Text(movieData.movies[0].overview)
                  ],
                );
              }

    }
    )
    );
  }
}
