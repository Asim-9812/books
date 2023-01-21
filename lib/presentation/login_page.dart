import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sampleflutter/constant/colors.dart';
import 'package:sampleflutter/presentation/sign_up.dart';

class LoginPage extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(Icons.fireplace_rounded,color: Color(0xFFFFFCB2B),),
            SizedBox(width: 10.w,),
            Text('FireChat',style: TextStyle(fontSize: 25.sp, color: Color(0xFFFFFCB2B) ),),
          ],
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login Page',style: TextStyle(fontSize: 25.sp,color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 10.h,
            ),
           ClipRRect(
             borderRadius: BorderRadius.circular(10),
             child: Container(
                  decoration: BoxDecoration(
                    border: Border.all()
                  ),
                  // color: Colors.red,
                  height: 200.h,
                  width: 250.w,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 8),
                        child: TextFormField(
                          controller: emailController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),

                              // fillColor: Colors.black,
                              filled: true,
                              hintText: 'E-MAIL', hintStyle: TextStyle(color: Colors.black)
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 8),
                        child: TextFormField(

                            controller: passwordController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                // fillColor: Colors.black,
                                filled: true,
                                hintText: 'Password', hintStyle: TextStyle(color: Colors.black)
                            )
                        ),
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: primary
                          ),
                          onPressed: (){}, 
                          child: Text('Login',style: TextStyle(fontSize: 20.sp),))
                    ],
                  ),
                ),
           ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account,',style: TextStyle(color: Colors.black),),
                TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: primary
                    ),
                    onPressed: (){
                      Get.to(()=>SignUpPage());
                    },
                    child: Text('Create One',))
              ],
            )

          ],

                  ),
                ),
              );

  }
}


