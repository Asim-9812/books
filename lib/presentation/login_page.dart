import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sampleflutter/common/snack_show.dart';
import 'package:sampleflutter/constant/colors.dart';
import 'package:sampleflutter/presentation/sign_up.dart';
import '../providers/auth_provider.dart';
import '../providers/toggle_provider.dart';

class LoginPage extends ConsumerStatefulWidget {

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    ref.listen(authProvider, (previous, next) {
      if(next.errorMessage.isNotEmpty){
        SnackShow.showFailure(context, next.errorMessage);
      }else{
        SnackShow.showSuccess(context, 'Success');
      }

    });


    final auth =ref.watch(authProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(Icons.fireplace_rounded,color: Color(0xFFFFFCB2B),),
            SizedBox(width: 10.w,),
            Text('Sample Shop',style: TextStyle(fontSize: 25.sp, color: Color(0xFFFFFCB2B) ),),
          ],
        ),
      ),

      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final isLogin = ref.watch(loginProvider);
          final image=ref.watch(imageProvider);
        return Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login Page',style: TextStyle(fontSize: 25.sp,color: primary,fontWeight: FontWeight.bold),),
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
                    height: isLogin? 250.h : 450.h,
                    width: 250.w,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 8),
                          child: TextFormField(
                            controller: emailController,
                              validator:(val){
                                if(val!.isEmpty){
                                  return 'e-mail is  required';
                                }
                                else if(!val.contains('@')){
                                  return 'please enter valid email';
                                }
                                return null;
                              },
                            style: TextStyle(color: Colors.white),
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
                                hintText: 'E-MAIL', hintStyle: TextStyle(color: Colors.grey)
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 8),
                          child: TextFormField(
                            obscureText: true,
                              controller: passwordController,
                              validator:(val){
                                if(val!.isEmpty){
                                  return 'password is  required';
                                }
                                else if(val.length>20){
                                  return 'maximum character exceeded';
                                }
                                return null;
                              },
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
                                  hintText: 'Password', hintStyle: TextStyle(color: Colors.grey)
                              )
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: primary
                            ),
                            onPressed: (){
                              _form.currentState!.save();
                              FocusScope.of(context).unfocus();
                              if(_form.currentState!.validate()){


                                  ref.read(authProvider.notifier).userLogin(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim());

                                }


                            },
                            child:
                            auth.isLoad? Center(child: CircularProgressIndicator(),) :
                            Text('Login',style: TextStyle(fontSize: 20.sp),))
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
                  Text('Don\'t have an account?' ,style: TextStyle(color: Colors.grey),),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: primary
                      ),
                      onPressed: (){
                        //_form.currentState!.reset();
                        Get.to(()=>SignUpPage(),transition:Transition.leftToRight);

                      },
                      child: Text('Sign Up',))
                ],
              )


            ],

                    ),
        );}
      ),
              );

  }
}


