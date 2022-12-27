import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sampleflutter/view/Homepage.dart';


void main(){


  runApp(Home());

}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    //
    //   theme: ThemeData().copyWith(
    //     buttonTheme: ButtonThemeData().copyWith(
    //       buttonColor: Colors.pink
    //     ),
    //         backgroundColor: Colors.green,
    //   ),
    //
    );
  }

}













// import 'package:sampleflutter/models/bank.dart';
// import 'package:sampleflutter/models/cars.dart';
// import 'package:sampleflutter/models/inheritance.dart';
//
//
// extension adding on List<int>{
//
//   int total (){
//     return this.reduce((value, element) => value + element);
//   }
//
// }
//
//
// void main(){
//
//   List<int> some=[11,22,33,44];
//   print(some.total());


  // final sometxt = 'hello';
  // print(sometxt.duplicateText());


  // final  per = Person();
  // per.runall();

  // const data=[
  //   {
  //     'id':1,
  //     'title':'ram'
  //   },
  //   {
  //     'id':2,
  //
  //   }
  // ];
  //
  // final d = data[1]['title'] ?? 'no-title';
  // print (d);





  // String? image;
  //
  // print (image);
  //
  //
  // int? a;
  // int b =90;
  //
  // if (b>89){
  //   a=90;
  // }
  //
  // final sum=a! + 9090;

  // final dog1= dog();
  // final cat1= cat();
  // dog1.eat();
  // cat1.sit();


//}