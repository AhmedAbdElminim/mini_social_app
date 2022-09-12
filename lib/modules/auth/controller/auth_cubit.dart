import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/shared/network/dio_helper.dart';
import 'package:mini_social_app/shared/network/end_points.dart';

import '../../../shared/component/constatnt.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);
  Future<void> loginUser({
    required String userName,
    required String password,
  }) async {
    emit(LoginLoadingState());

    try {
      await DioHelper.postData(
          url: LOGIN,
          data: {"username": userName, "password": password}).then((value) {
        token = value.data['token'];
        emit(LoginSuccessState());
      });
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        emit(LoginErrorState('password is wrong'));
      }
      if (e.response!.statusCode == 404) {
        emit(LoginErrorState('user not found'));
      }
    }
  }

  Future<void> registerUser({
    required String firstName,
    required String lastName,
    required String userName,
    required String password,
  }) async {
    emit(RegisterLoadingState());

    try {
      await DioHelper.postData(url: REGISTER, data: {
        "firstName": firstName,
        "lastName": lastName,
        "username": userName,
        "password": password
      }).then((value) {
        emit(RegisterSuccessState());
      });
    } on DioError catch (e) {
      emit(RegisterErrorState(e.toString()));
    }
  }

  bool isSecure = true;
  void changePasswordVisibility() {
    isSecure = !isSecure;
    emit(ChangePasswordVisibilityState());
  }
}
