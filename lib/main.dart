import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sampleflutter/presentation/login_page.dart';
import 'package:sampleflutter/presentation/status_page.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(milliseconds: 50));

  await Hive.initFlutter();

  final userBox = await Hive.box<String>('user');



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
          theme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: LoginPage(),
    );
  }
}
