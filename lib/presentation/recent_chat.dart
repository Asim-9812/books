import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:sampleflutter/presentation/chat_page.dart';

import '../providers/room_provider.dart';

class RecentChat extends ConsumerWidget {

  @override
  Widget build(BuildContext context,ref) {

    final room = ref.watch(roomStream);
    return Scaffold(
        body: room.when(
            data: (data){
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      onTap: (){
                        Get.to(()=>ChatPage(data[index]));
                      },

                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(data[index].imageUrl!),
                      ),
                      title: Text(data[index].name!),
                    );

                  });
            },
            error: (err,stack) => Text('$err'),
            loading: ()=> CircularProgressIndicator())
    );
  }
}
