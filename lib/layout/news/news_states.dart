abstract class NewsStates {}

class NewsAppInitialState extends NewsStates {}

class NewsChangeBottomNav extends NewsStates {}

class GetBusinessNewsLoadingState extends NewsStates {}

class GetBusinessNewsSuccessState extends NewsStates {}

class GetBusinessNewsErrorState extends NewsStates {
  final String error;
  GetBusinessNewsErrorState(this.error);
}

class GetSportsNewsLoadingState extends NewsStates {}

class GetSportsNewsSuccessState extends NewsStates {}

class GetSportsNewsErrorState extends NewsStates {
  final String error;
  GetSportsNewsErrorState(this.error);
}

class GetScienceNewsLoadingState extends NewsStates {}

class GetScienceNewsSuccessState extends NewsStates {}

class GetScienceNewsErrorState extends NewsStates {
  final String error;
  GetScienceNewsErrorState(this.error);
}

class GetSearchNewsLoadingState extends NewsStates {}

class GetSearchNewsSuccessState extends NewsStates {}

class GetSearchNewsErrorState extends NewsStates {
  final String error;
  GetSearchNewsErrorState(this.error);
}