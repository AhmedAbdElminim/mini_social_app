abstract class NewPostStates {}

class NewPostInitialState extends NewPostStates {}

class NewPostLoadingState extends NewPostStates {}

class NewPostSuccessState extends NewPostStates {}

class NewPostErrorState extends NewPostStates {
  final String error;
  NewPostErrorState(this.error);
}
