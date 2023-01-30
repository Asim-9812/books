import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:sampleflutter/common/firebase_instances.dart';

import '../providers/room_provider.dart';

class ChatPage extends ConsumerWidget {

  final types.Room room;
  ChatPage(this.room);

  @override
  Widget build(BuildContext context,ref) {
    final messageData = ref.watch(messageStream(room));
    return Scaffold(
        body: messageData.when(
            data: (data) => Chat(
              messages: data,
              showUserAvatars: true,
              showUserNames: true,
              onSendPressed: (PartialText val){

                FirebaseInstances.firebaseChatCore.sendMessage(val, room.id);

              },user: types.User(
              id: FirebaseInstances.firebaseChatCore.firebaseUser!.uid
            ),
            ),
            error: (err,stack) => Text('$err'),
            loading: ()=> CircularProgressIndicator())
    );
  }
}
