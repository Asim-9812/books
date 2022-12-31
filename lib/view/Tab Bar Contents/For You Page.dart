import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampleflutter/constant/colors.dart';

import '../../models/book.dart';

class FYP extends StatelessWidget {
  const FYP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:[ Container(
          height: 180.h,
          child: SizedBox(
            height: 180.h,
            child: ListView.builder(
              //for scrolling across left and right
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder:(context,index){
                  return Row(
                    children: [
                      Stack(
                          children:[

                            //for aligning the container inside a stack

                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child:
                                Container(
                                  width:350.w,
                                  height: 140.w,
                                  color: Color.fromRGBO(1, 1, 1, 0.5),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8,right: 8,bottom: 20,left: 130),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(books[index].title,style: TextStyle(color: Color(0xFFFEBC879),fontSize: 20.sp,fontWeight: FontWeight.bold),),
                                        Padding(
                                          padding: const EdgeInsets.only(top:10,bottom: 15),
                                          child: Text(books[index].detail,maxLines: 3,style: TextStyle(color: Colors.white)),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(books[index].rating),
                                            Padding(
                                              padding: const EdgeInsets.only(right:10),
                                              child: Text(books[index].genres,style: TextStyle(color: Color(0xFFFEBC879)),),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              left: 10,
                              bottom:20,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(books[index].imageUrl,width: 100.w,)),
                            )
                          ]),


                      SizedBox(width:10.w)
                    ],

                  );
                }
            ),
          ),
        ),
          SizedBox(height: 25.h),
          Container(
            // color: primary,
            margin: EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Continue Reading',style: TextStyle(color: primary,fontSize: 25.sp),),
                SizedBox(height: 10.h,),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    margin: EdgeInsets.only(right: 20.w),
                    height: 155.h,
                    // width: 360.w,

                    // color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(readingbooks.imageUrl,width: 100.w,),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)
                            ),
                            child: Container(
                              height: 155.h,
                              // width: 360.w,
                              color: secondary,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10,top: 20,right: 20,bottom: 40),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(readingbooks.title,style: TextStyle(color: primary,fontWeight: FontWeight.bold,fontSize: 20.sp),),
                                          Text(readingbooks.detail,maxLines: 2,style: TextStyle(color: Colors.white,fontSize: 12.sp),),
                                          Text(readingbooks.genres,style: TextStyle(color: primary),),

                                        ],
                                      ),
                                    ),
                                  ),

                                  VerticalDivider(
                                    color: Colors.white30,  //color of divider
                                    width: 30, //width space of divider
                                    thickness: 1, //thickness of divier line
                                    indent: 10, //Spacing at the top of divider.
                                    endIndent: 10, //Spacing at the bottom of divider.
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Icon(Icons.arrow_circle_right_outlined,color: primary,size: 25.w,),
                                  ),



                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    
                  ),
                )
              ],
            ),
          ),

      ]),
    );
  }
}
