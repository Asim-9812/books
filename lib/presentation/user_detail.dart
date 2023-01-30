import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:sampleflutter/presentation/chat_page.dart';
import 'package:sampleflutter/services/crud_service.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../providers/room_provider.dart';

class UserDetail extends ConsumerWidget {

  final types.User user ;
  UserDetail(this.user);

  @override
  Widget build(BuildContext context,ref) {
    final postData= ref.watch(postStream);

    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(user.imageUrl!),
                    ),

                    Column(
                      children: [
                        Text(user.firstName!),
                        Text(user.metadata!['email']),
                        ElevatedButton(
                            onPressed: () async {
                              final response = await ref.read(roomProvider).roomCreate(user);
                              if(response!=null){
                                Get.to(()=>ChatPage(response),transition: Transition.leftToRight);
                              }
                            },
                            child: Text('Start Chat') )
                      ],
                    )
                  ],
                ),
              ),

              postData.when(
                  data: (data){
                    final userPost= data.where((element) => element.userId== user.id).toList();
                    return Expanded(
                      child: GridView.builder(
                        itemCount: userPost.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        itemBuilder: (context,index){
                          return Image.network(userPost[index].imageUrl);
                        },
                      ),
                    );

                  },
                  error: (err,stack) => Text('$err'),
                  loading: ()=> CircularProgressIndicator()

              )
            ],
          ),
        )
    );
  }
}
