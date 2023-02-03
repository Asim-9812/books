import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sampleflutter/presentation/crud_page.dart';
import 'package:sampleflutter/providers/auth_provider.dart';
import 'package:sampleflutter/services/crud_service.dart';

import 'create_post.dart';

class HomePage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ref) {
    final productData= ref.watch(products);

    final auth = ref.watch(authProvider);
    FlutterNativeSplash.remove();

    return Scaffold(
        appBar: AppBar(
          title: Text('Sample Shop'),
        ),
        drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Text(auth.user!.email),
                ),
                ListTile(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  leading: Icon(Icons.email),
                  title: Text(auth.user!.email),
                ),
                ListTile(
                  onTap: (){
                    Navigator.of(context).pop();
                    Get.to(() => CreatePage(), transition: Transition.leftToRight);
                  },
                  leading: Icon(Icons.add),
                  title: Text('Create Product'),
                ),

                ListTile(
                  onTap: (){
                    ref.read(authProvider.notifier).userLogOut();
                  },
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Log Out'),
                ),

                ListTile(
                  onTap: (){
                    Navigator.of(context).pop();
                    Get.to(() => CrudPage(), transition: Transition.leftToRight);
                  },
                  leading: Icon(Icons.add),
                  title: Text('Customize Product'),
                ),
              ],
            )

        ),
        body:  Container(
          child: productData.when(
              data: (data){
                return GridView.builder(
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 2/3
                  ),
                  itemBuilder: (context, index){
                    return GridTile(
                        child: Image.network(data[index].image,fit: BoxFit.cover,),
                        footer: Container(
                          height: 50.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Rs.${data[index].price}'),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(data[index].product_name),
                            ],
                          ),
                        ),
                    );
                  },
                );
              },
              error: (err, stack) => Center(child: Text('$err')),
              loading: () => Center(child: CircularProgressIndicator())
          ),
        )
    );
  }
}