import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pod_player/pod_player.dart';

import '../models/movie.dart';
import '../providers/video_provider.dart';


class DetailPage extends ConsumerWidget {
  final Movie movie;
  DetailPage(this.movie);
  @override
  Widget build(BuildContext context, ref) {
    final videoData = ref.watch(videoProvider(movie.id));
    return Scaffold(
        body: Column(
          children: [
            if(videoData.videos.isNotEmpty) PlayVideoFromNetwork(videoData.videos[0].key),
            if(videoData.errorMessage.isNotEmpty) Text(videoData.errorMessage),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(child: Text(movie.title,style: TextStyle(fontSize: 25.sp),),),
            ),
            Container(
              
              child: Expanded(
                child: ListView(
                  children:[
                    Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Container(
                              height: 200.h,
                              width: 150.w,
                              child: Image.network(movie.poster_path)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text('Release Date',style: TextStyle(fontSize: 20.sp),),
                                Divider(
                                  indent: 10.w,
                                  endIndent: 10.w,
                                  color: Colors.grey,
                                ),
                                Text(movie.release_date),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text('Rating',style: TextStyle(fontSize: 20.sp),),
                                Divider(
                                  indent: 10.w,
                                  endIndent: 10.w,
                                  color: Colors.grey,
                                ),
                                Text(movie.vote_average),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Center(
                              child: Text('OVERVIEW',style: TextStyle(fontSize: 25.sp),),
                            ),
                            Divider(
                              indent: 10.w,
                              endIndent: 10.w,
                              color: Colors.grey,
                            ),

                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(movie.overview),
                                    Text(movie.overview),
                                    Text(movie.overview),
                                    Text(movie.overview),
                                    Text(movie.overview),
                                    Text(movie.overview),
                                    Text(movie.overview),
                                    Text(movie.overview),
                                    Text(movie.overview),
                                    Text(movie.overview),
                                    Text(movie.overview),
                                    Text(movie.overview),
                                    Text(movie.overview),
                                    Text(movie.overview),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
           ] ),
              ),
            )
          ],
        )
    );
  }
}



class PlayVideoFromNetwork extends StatefulWidget {
  final String keys;
  PlayVideoFromNetwork(this.keys);
  @override
  State<PlayVideoFromNetwork> createState() => _PlayVideoFromNetworkState();
}

class _PlayVideoFromNetworkState extends State<PlayVideoFromNetwork> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
        playVideoFrom: PlayVideoFrom.youtube('https://youtu.be/${widget.keys}'),
        podPlayerConfig: const PodPlayerConfig(
            autoPlay: true,
            // isLooping: false,
            videoQualityPriority: [1080, 720]
        )
    )..initialise();


    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PodVideoPlayer(controller: controller,
    );
  }
}