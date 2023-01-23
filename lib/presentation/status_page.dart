import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/presentation/homepage.dart';
import 'package:sampleflutter/providers/auth_provider.dart';

import 'auth_page.dart';


class StatusPage extends ConsumerWidget {

  @override
  Widget build(BuildContext context,ref) {
    final auth=ref.watch(authStream);
    return Container(
      child: auth.when(
          data: (data){
            if(data == null){
              return AuthPage();
            }else{
              return Homepage();
            }
          },
          error: (err,stack)=> Text('$err'),
          loading: ()=>CircularProgressIndicator()),
    );
  }
}
