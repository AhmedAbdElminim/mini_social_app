import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/models/data_model.dart';
import 'package:mini_social_app/shared/network/dio_helper.dart';

import '../../../shared/component/constatnt.dart';
import '../../../shared/network/end_points.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);
  //String token =
  // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2Vyc19pZCI6MzYsInVzZXJuYW1lIjoiYSIsInBhc3N3b3JkIjoiJDJiJDEwJFloUEN4Z3VsUmpKLnMvZDhqZzdVSHVUakxFWE1UOHhEUkF0Z2VVSk5yTVgyN0dRc1l4alhPIiwiaWF0IjoxNjYyOTgxMTE0LCJleHAiOjE2NjI5ODQ3MTR9.lWBuS5LJ6mPKreWsTkCKbbUARHjHHRpcGXncfOjDNnI';
  List<DataModel> data = [];
  Future getAllData() async {
    emit(GetDataLoadingState());
    await DioHelper.getData(url: GETDATA, token: token).then((value) {
      //print(value.data);
      value.data['content'].forEach((value) {
        data.add(DataModel.fromJson(value));
      });
      // print(data.length);
      emit(GetDataSuccessesState());
    }).catchError((error) {
      emit(GetDataErrorState(error.toString()));
    });
  }
}
