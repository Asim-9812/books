

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sampleflutter/models/movie.dart';
import 'package:sampleflutter/presentation/searchpage.dart';
import 'package:sampleflutter/presentation/widget/tab_bar_widget.dart';

class Homepage extends ConsumerWidget {


  @override
  Widget build(BuildContext context,ref) {
    FlutterNativeSplash.remove();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50.h,
          title: Text('Movies TMDB',),
          actions: [
            IconButton(onPressed: (){
              Get.to(() => SearchPage(),transition : Transition.leftToRight);
            }, icon: Icon(Icons.search))
          ],

          bottom: TabBar(tabs:
          [
            Tab(text: 'Popular',),
            Tab(text: 'Upcoming Movies',),
            Tab(text: 'Top Rated',)
          ]
          ),
        ),

        body: TabBarView(
            children: 
            [
              TabBarWidget(Categories.popular),
              TabBarWidget(Categories.upcoming),
              TabBarWidget(Categories.top_rated)
            ]
        ),

      ),
    );
  }
}
