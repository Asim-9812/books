import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampleflutter/providers/auth_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:sampleflutter/services/crud_service.dart';
import 'create_post.dart';



class HomePage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ref) {
    FlutterNativeSplash.remove();
    final users = ref.watch(usersStream);
    final postData = ref.watch(postStream);
    return Scaffold(
        appBar: AppBar(
          title: Text('Sample Social'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                onTap: (){
                  Navigator.of(context).pop();
                  Get.to(() => CreatePage(), transition: Transition.leftToRight);
                },
                leading: Icon(Icons.add),
                title: Text('Create Post'),
              ),



              ListTile(
                onTap: (){
                  ref.read(authProvider.notifier).userLogOut();
                },
                leading: Icon(Icons.exit_to_app),
                title: Text('Log Out'),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 150.h,
              child: users.when(
                  data: (data){
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (context, index){
                          return Container(
                            width: 100.w,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: CachedNetworkImageProvider(data[index].imageUrl!),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(data[index].firstName!, style: TextStyle(fontSize: 17.sp),)
                                ],
                              ),
                            ),
                          );
                        }
                    );
                  },
                  error: (err, stack) => Center(child: Text('$err')),
                  loading: () => Container()
              ),
            ),

            Expanded(
                child: postData.when(
                    data: (data){
                      return ListView.builder(
                        itemCount: data.length,
                          itemBuilder: (context , index){
                            final post = data[index];
                            return Column(
                              children: [
                                Image.network(post.imageUrl)
                              ],
                            );
                          });
                    },
                    error: (err, stack)=> Text('$err'),
                    loading: ()=>Center(child: CircularProgressIndicator())))
          ],
        )
    );
  }
}