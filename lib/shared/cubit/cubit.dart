import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/shared/cubit/states.dart';
import 'package:flutter_news_app/shared/data/local/chache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark=false;

  void changeDarkMode({bool? fromShared}){
    if(fromShared != null){
      isDark=fromShared;
      emit(AppDarkMode());

    }else{
      isDark= !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) => {
        emit(AppDarkMode())
      });
    }

  }

}