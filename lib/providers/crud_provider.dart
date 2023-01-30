import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sampleflutter/services/crud_service.dart';
import '../model/crud_state.dart';
import '../model/post.dart';

final crudProvider = StateNotifierProvider<CrudNotifier, CrudState>((ref) => CrudNotifier(CrudState.empty()));

class CrudNotifier extends StateNotifier<CrudState> {
  CrudNotifier(super.state);


  Future<void> addPost({
    required String title,
    required String detail,
    required String userId,
    required XFile image
  }) async {
    state = state.copyWith(isLoad: true, errorMessage: '', isSuccess: false);
    final response = await CrudService.addPost(
        title: title,
        detail: detail,
        userId: userId,
        image: image);
    response.fold((l) {
      state = state.copyWith(isLoad: false, errorMessage: l, isSuccess: false);
    }, (r) {
      state = state.copyWith(isLoad: false, errorMessage: '', isSuccess: true);
    });
  }


  Future<void> delPost({
    required String postId,
    required String imageId,
  }) async {
    state = state.copyWith(isLoad: true, errorMessage: '', isSuccess: false);
    final response = await CrudService.delPost(
        postId: postId,
        imageId: imageId);
    response.fold((l) {
      state = state.copyWith(isLoad: false, errorMessage: l, isSuccess: false);
    }, (r) {
      state = state.copyWith(isLoad: false, errorMessage: '', isSuccess: true);
    });
  }

  Future<void> addLike({
    required List<String> username,
    required int like,
    required String postId
  }) async {

    state = state.copyWith(isLoad: true, errorMessage: '', isSuccess: false);
    final response = await CrudService.addLike(username: username, like: like, postId: postId);
    response.fold((l) {
      state = state.copyWith(isLoad: false, errorMessage: l, isSuccess: false);
    }, (r) {
      state = state.copyWith(isLoad: false, errorMessage: '', isSuccess: true);
    });


  }

  Future<void> updatePost({
    required String title,
    required String detail,
    required String postId,
    XFile? image,
    required String? imageId
  }) async {

    state = state.copyWith(isLoad: true, errorMessage: '', isSuccess: false);
    final response = await CrudService.updatePost(
        title: title,
        detail: detail,
        postId: postId,
        image: image,
        imageId: imageId);
    response.fold((l) {
      state = state.copyWith(isLoad: false, errorMessage: l, isSuccess: false);
    }, (r) {
      state = state.copyWith(isLoad: false, errorMessage: '', isSuccess: true);
    });
  }

  Future<void> addComment({
    required List<Comment> comments,
    required String postId
  })  async {
    state = state.copyWith(isLoad: true, errorMessage: '', isSuccess: false);
    final response = await CrudService.addComment(comments: comments, postId: postId);
    response.fold((l) {
      state = state.copyWith(isLoad: false, errorMessage: l, isSuccess: false);
    }, (r) {
      state = state.copyWith(isLoad: false, errorMessage: '', isSuccess: true);
    });
  }



}
