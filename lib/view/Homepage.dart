import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampleflutter/models/book.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    // final actualHeight=height - 50 - MediaQuery.of(context).padding.top;
    final width = MediaQuery.of(context).size.width;
    // final actualWidth=width - 50 - MediaQuery.of(context).padding.left;


    return Scaffold(
      backgroundColor: Color(0xFFF1e1e1e),

      appBar: AppBar(
        // backgroundColor: Colors.purple,
        backgroundColor: Colors.black,
        // backgroundColor: Color.fromRGBO(20, 90, 100, 0.5),
        // elevation: 20,
        title: Text('Philosopher\'s Journal',style: TextStyle(color: Color(0xFFFEBC879),fontWeight: FontWeight.bold,fontSize: 20.sp),),
        // toolbarHeight: 200,
        actions: [
          Icon(Icons.search, color: Color(0xFFFEBC879), size: 20.h,),
          SizedBox(width: 10.w,),
          Icon(Icons.notifications_active_outlined, color: Color(0xFFFEBC879), size: 20.h,),
          SizedBox(width: 10.w,),


        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            // padding: EdgeInsets.all(10),
            // height: 250.h,
            width: double.infinity,
            // decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(8.0)),color: Color(0xFFFEBC879),),
              child:  ClipRRect(
                  borderRadius: BorderRadius.circular(10),

                  child:Image.asset('assets/images/greeks.JPG',fit: BoxFit.cover,)
              )
          ),

          // SizedBox(height: 10,),
          Container(

            margin: EdgeInsets.only(left: 10),
            // color: Colors.cyan,
            height: 180.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder:(context,index){
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(
                        children:[
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child:
                            Container(

                              width:350.w,
                              height: 140.w,
                              color: Color.fromRGBO(1, 1, 1, 0.5),
                              child: Expanded(
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
                                          Text(books[index].genres,style: TextStyle(color: Color(0xFFFEBC879)),)
                                        ],
                                      )
                                    ],
                                  ),
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
          )

        ],
      ),

    );
  }
}
