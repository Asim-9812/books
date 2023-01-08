import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sampleflutter/presentation/homepage.dart';



final dio = Dio();

Future<void> getData () async {
  
  try{
    
    final response = await dio.get('https://api.themoviedb.org/3/movie/popular?api_key=2a0f926961d00c667e191a21c14461f8&page=1');
    print(response.data);
    
  }on DioError catch(err){
    print(err.message);
    print(err.response);
    
  }
  
}



void main(){


  getData();

  runApp(ProviderScope(child: Home()));

}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
      designSize: const Size(392, 850),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: Homepage(),
    );
  }
}
