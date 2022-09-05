import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/layout/news/news_states.dart';
import 'package:flutter_news_app/shared/data/remote/dio_helper.dart';

import '../../modules/business_news/business_screen.dart';
import '../../modules/science_news/science_screen.dart';
import '../../modules/sports_news/sports_news.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsAppInitialState());

  int currentIndex = 0;
  List<Widget> screens = [BusinessScreen(), SportsScreen(), ScienceScreen()];

  static NewsCubit get(context) => BlocProvider.of(context);

  void changeBottomNav(int index) {
    currentIndex = index;
    if (index == 1) {
      getSportsData();
    } else if (index == 2) {
      getScienceData();
    }
    emit(NewsChangeBottomNav());
  }

  List<dynamic> businessList = [];
  List<dynamic> sportsList = [];
  List<dynamic> scienceList = [];
  List<dynamic> searchList = [];

  void getBusinessData() {
    emit(GetBusinessNewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'bdc695c2d6c64e9a82a711dc5575b9d1',
    }).then((value) {
      print(value!.data.toString());
      businessList = value.data['articles'];
      emit(GetBusinessNewsSuccessState());
    }).catchError((onError) {
      print('error' + onError.toString());
      emit(GetBusinessNewsErrorState('error is : ' + onError.toString()));
    });
  }

  void getSportsData() {
    emit(GetSportsNewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sport',
      'apiKey': 'bdc695c2d6c64e9a82a711dc5575b9d1',
    }).then((value) {
      print(value!.data.toString());
      sportsList = value.data['articles'];
      emit(GetSportsNewsSuccessState());
    }).catchError((onError) {
      print('error' + onError.toString());
      emit(GetSportsNewsErrorState('error is : ' + onError.toString()));
    });
  }

  void getScienceData() {
    emit(GetScienceNewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'bdc695c2d6c64e9a82a711dc5575b9d1',
    }).then((value) {
      print(value!.data.toString());
      scienceList = value.data['articles'];
      emit(GetScienceNewsSuccessState());
    }).catchError((onError) {
      print('error' + onError.toString());
      emit(GetScienceNewsErrorState('error is : ' + onError.toString()));
    });
  }

  void getSearchData(String query) {
    searchList = [];
    emit(GetSearchNewsLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {'q': '$query', 'apiKey': 'bdc695c2d6c64e9a82a711dc5575b9d1'},
    ).then((value) {
      searchList = value?.data['articles'];
      emit(GetSearchNewsSuccessState());
    }).catchError((onError) {
      emit(GetSearchNewsErrorState('error is : ' + onError.toString()));
    });
  }
}
