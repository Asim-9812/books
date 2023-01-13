// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sampleflutter/models/movie.dart';
import 'package:sampleflutter/providers/movie_provider.dart';

class TabBarWidget extends StatelessWidget {
  final Categories categories;
  TabBarWidget(this.categories);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer(
            builder: (context,ref, child) {
              final movieData= ref.watch(movieProvider(categories));
              final data = categories == Categories.top_rated ? movieData.topRatedMovies : categories == Categories.upcoming ? movieData.upcomingMovies : movieData.popularMovies ;
              return movieData.isLoad ? Center(child: CircularProgressIndicator()) :
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    childAspectRatio : 2/3,
                    crossAxisSpacing: 5
                ),
                    itemBuilder: (context,index){
                    return Column(
                    children: [
                      CachedNetworkImage(
                        errorWidget: (c,s,d){
                          return Icon(Icons.play_circle_outline,size: 20.h,);
                        },
                          imageUrl: data[index].poster_path,
                        placeholder: (c,s){
                            return Container(
                              height: 120.h,
                              child: Center(
                                child: SpinKitFadingCube(
                                  color: Colors.blue,
                                  size: 20.h,
                                ),
                              ),
                            );
                        },
                      ),

                    ],
                    );
                }),
              );
    }
    )
    );}
}
