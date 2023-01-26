import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sampleflutter/services/crud_service.dart';
import '../model/crud_state.dart';

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
    required List<String> usernames,
    required int like,
    required String postId
  }) async {
      state = state.copyWith(isLoad: true, errorMessage: '', isSuccess: false);
      final response = await CrudService.addLike(
          postId: postId,
          usernames: [],
          like: like);
      response.fold((l) {
        state = state.copyWith(isLoad: false, errorMessage: l, isSuccess: false);
      }, (r) {
        state = state.copyWith(isLoad: false, errorMessage: '', isSuccess: true);
      });
    }

}
