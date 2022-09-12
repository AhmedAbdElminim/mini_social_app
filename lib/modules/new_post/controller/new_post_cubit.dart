import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/shared/component/constatnt.dart';
import 'package:mini_social_app/shared/network/dio_helper.dart';

import '../../../shared/network/end_points.dart';
import 'new_post_states.dart';

class NewPostCubit extends Cubit<NewPostStates> {
  NewPostCubit() : super(NewPostInitialState());
  static NewPostCubit get(context) => BlocProvider.of(context);
  Future createPost({
    required String caption,
    required String profileImage,
    required String contentImage,
  }) async {
    emit(NewPostLoadingState());
    try {
      await DioHelper.postData(
        url: POSTDATA,
        data: {
          "caption": caption,
          "display_picture": profileImage,
          "display_content": contentImage
        },
        token: token,
      ).then((value) {
        emit(NewPostSuccessState());
      });
    } on DioError catch (e) {
      emit(NewPostErrorState(e.toString()));
    }
  }
}
