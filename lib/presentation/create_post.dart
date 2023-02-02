import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sampleflutter/common/snack_show.dart';
import 'package:sampleflutter/constant/colors.dart';
import 'package:sampleflutter/providers/auth_provider.dart';
import '../providers/crud_provider.dart';
import '../providers/toggle_provider.dart';

class CreatePage extends ConsumerWidget {

  final titleController = TextEditingController();
  final detailController = TextEditingController();
  final priceController = TextEditingController();


  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context,ref) {

    ref.listen(crudProvider, (previous, next) {
      if(next.errorMessage.isNotEmpty){
        SnackShow.showFailure(context, next.errorMessage);
      } else if (next.isSuccess){
        Get.back();
      }

    });

    final image=ref.watch(imageProvider);
    final crud =ref.watch(crudProvider);
    final auth = ref.watch(authProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(Icons.add_circle_outline,color: Color(0xFFFFFCB2B),),
            SizedBox(width: 10.w,),
            Text('Create Post',style: TextStyle(fontSize: 25.sp, color: Color(0xFFFFFCB2B) ),),
          ],
        ),
      ),

      body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {

            return Form(
              key: _form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                          child: TextFormField(
                              controller: titleController,
                              validator:(val){
                                if(val!.isEmpty){
                                  return 'Title is  required';
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                  // enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  // fillColor: Colors.black,
                                  // filled: true,
                                  hintText: 'Title', hintStyle: TextStyle(color: Colors.grey)
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 8),
                          child: Stack(
                            children: [TextFormField(
                                // obscureText: true,
                                controller: detailController,
                                validator:(val){
                                  if(val!.isEmpty){
                                    return 'Detail is  required';
                                  }
                                  else if(val.length>200){
                                    return 'maximum character exceeded';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 10, bottom: 10,left: 5,right:50),
                                    // enabledBorder: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    // fillColor: Colors.black,
                                    // filled: true,
                                    hintText: 'Detail', hintStyle: TextStyle(color: Colors.grey)
                                )
                            ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                    controller: priceController,
                                    validator:(val){
                                      if(val!.isEmpty){
                                        return 'price is  required';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                        // enabledBorder: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        // fillColor: Colors.black,
                                        // filled: true,
                                        hintText: 'Title', hintStyle: TextStyle(color: Colors.grey)
                                    )
                                ),
                              ),
                              if(image == null)
                                Positioned(
                                right: 10.w,
                                  bottom: 15,
                                  child:  InkWell(
                                      onTap: (){
                                        ref.read(imageProvider.notifier).pickAnImage();
                                      },
                                      child: Icon(Icons.add_photo_alternate_outlined)
                                  ),
                              )
                            ]
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        image == null  ? Container(): Image.file(File(image.path),width: 100.w,height: 100.w,),


                        TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: primary
                            ),
                            onPressed: (){
                              _form.currentState!.save();
                              FocusScope.of(context).unfocus();
                              if(_form.currentState!.validate()){


                                  if(image==null){
                                    SnackShow.showFailure(context, 'Please select an image');
                                  }else{

                                    ref.read(crudProvider.notifier).addProduct(
                                        title: titleController.text.trim(),
                                        detail: detailController.text.trim(),
                                        price: int.parse(priceController.text.trim()),
                                        token: auth.user!.token,
                                        image: image);

                                  }
                                }


                            },
                            child: crud.isLoad? Center(child: CircularProgressIndicator(),) :
                            Text('Submit',style: TextStyle(fontSize: 20.sp),))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                ],

              ),
            );}
      ),
    );

  }
}


