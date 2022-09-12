abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class GetDataLoadingState extends HomeStates {}

class GetDataSuccessesState extends HomeStates {}

class GetDataErrorState extends HomeStates {
  final String error;
  GetDataErrorState(this.error);
}
