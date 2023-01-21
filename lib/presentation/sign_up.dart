import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sampleflutter/constant/colors.dart';
import 'package:sampleflutter/presentation/login_page.dart';

class SignUpPage extends StatelessWidget {
  

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(Icons.fireplace_rounded,color: Color(0xFFFFFCB2B),),
            SizedBox(width: 10.w,),
            Text('FireChat',style: TextStyle(fontSize: 25.sp, color: Color(0xFFFFFCB2B) ),),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sign Up',style: TextStyle(fontSize: 25.sp,color: primary,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 10.h,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                      controller: usernameController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),

                          // fillColor: Colors.black,
                          filled: true,
                          hintText: 'Enter an username', hintStyle: TextStyle(color: Colors.grey)
                      )
                  ),
                  SizedBox(height: 5.h,),
                  TextFormField(
                      controller: emailController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),

                          // fillColor: Colors.black,
                          filled: true,
                          hintText: 'Enter your E-MAIL', hintStyle: TextStyle(color: Colors.grey)
                      )
                  ),
                  SizedBox(height: 5.h,),
                  TextFormField(

                      controller: passwordController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          // fillColor: Colors.black,
                          filled: true,
                          hintText: 'Enter a Password', hintStyle: TextStyle(color: Colors.grey)
                      )
                  ),
                  Center(
                    child: TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: primary
                        ),
                        onPressed: (){},
                        child: Text('Sign Up',style: TextStyle(fontSize: 20.sp),)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account,',style: TextStyle(color: Colors.grey),),
                      TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: primary,
                          ),
                          onPressed: (){
                            Get.to(()=>LoginPage());
                          },
                          child: Text('Login       '))
                    ],
                  )

                ],
              ),
            ),

          ],

        ),
      ),
    );

  }
}


