import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sampleflutter/providers/counter_provider.dart';
import 'package:sampleflutter/view/todo_hompage.dart';
// import 'package:sampleflutter/view/Homepage.dart';


void main(){


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
      child: TodoHomePage(),
    );
  }
}


class Count extends StatelessWidget {

//
//   @override
//   State<Count> createState() => _CountState();
// }
//
// class _CountState extends State<Count> {
//
//   //variable declare here/function
//   int number = 0;
//
//   void addNumber(){
//     setState(() {
//       number++;
//     });
//   }
//   void minusNumber(){
//     setState(() {
//       number--;
//     });
//   }

  @override
  Widget build(BuildContext context) {

    return Scaffold(



    );








    // return Scaffold(
    //   body: SafeArea(
    //     child: Consumer(
    //       builder: (context,ref,child) {
    //         final number = ref.watch(countStateProvider);
    //         return Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text('${number}', style: TextStyle(fontSize: 50.sp),),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 ElevatedButton(
    //                     onPressed: () {
    //                      // ref.read(counterProvider).addNumber();
    //                       ref.read(countStateProvider.notifier).state++;
    //                     },
    //                     child: Text('add')
    //                 ),
    //                 SizedBox(width: 20.w,),
    //                 ElevatedButton(
    //                     onPressed: () {
    //                       // ref.read(counterProvider).minusNumber();
    //                       ref.read(countStateProvider.notifier).state--;
    //
    //                     },
    //
    //                     child: Text('minus')
    //                 )
    //
    //               ],
    //             )
    //
    //           ],
    //         );
    //       }
    //     ),
    //   )
    // );
  }

  //function
}
