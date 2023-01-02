import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampleflutter/constant/colors.dart';
import 'package:sampleflutter/models/book.dart';

class DetailPage extends StatelessWidget {
  // const DetailPage({Key? key}) : super(key: key);

  final Book book;
  DetailPage (this.book);



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: primary
        ),
        backgroundColor: secondary,
        title: Text(book.title,style: TextStyle(color: primary,fontSize: 25.sp),),
      ),
      body: ListView(
        children: [
          Image.network(book.imageUrl,height: 300.h,),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Text(book.detail),
              ],
            ),
          )

        ],
      ),
    );
  }
}
