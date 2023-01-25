

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sampleflutter/common/firebase_instances.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';

import '../model/post.dart';


final postStream  = StreamProvider((ref) => CrudService.getPosts());


class CrudService {

  static CollectionReference postDb = FirebaseInstances.fireStore.collection(
      'Posts');


  static Stream<List<Post>> getPosts(){
    return postDb.snapshots().map((event) => getSome(event));
  }

  static List<Post> getSome(QuerySnapshot querySnapshot){
    return querySnapshot.docs.map((e) {
      final post = e.data() as Map<String, dynamic> ;
      return Post(
          imageUrl: post['imageUrl'],
          like: Like.fromJson(post['like']),
          userId: post['userId'],
          detail: post['detail'],
          title: post['title'],
          id: e.id, 
          comments: (post['comments'] as List).map((e) => Comment.fromJson(e)).toList());
    }).toList();
  }

  static Future<Either<String, bool>> addPost({
    required String title,
    required String detail,
    required String userId,
    required XFile image
  }) async {
    try {
      final imageId = DateTime.now().toString();
      final ref = FirebaseInstances.firebaseStorage.ref().child(
          'postImage/$imageId');
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      await postDb.add({
        'title': title,
        'detail': detail,
        'imageUrl': url,
        'userId': userId,
        'comments':[],
        'like':{
          'likes':0,
          'usernames':[]
        }
      });

      return Right(true);
    } on FirebaseException catch (err) {
      return Left(err.message!);
    }
  }

  static Future<Either<String, bool>> delPost({
    required String postId,
    required String imageId,
  }) async {
    try {
      final imageId = DateTime.now().toString();
      final ref = FirebaseInstances.firebaseStorage.ref().child(
          'postImage/$imageId');
      await ref.delete();

      await postDb.doc(postId).delete();

      return Right(true);
    } on FirebaseException catch (err) {
      return Left(err.message!);
    }
  }

}