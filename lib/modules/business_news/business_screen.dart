import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/layout/news/news_cubit.dart';
import 'package:flutter_news_app/layout/news/news_states.dart';

import '../../shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list=NewsCubit.get(context).businessList;
        print("list of business ="+list.toString());
        return BuildCondition(
          condition: state is! GetBusinessNewsLoadingState,
          builder: (context) =>
              ListView.separated(
                physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildArticleItem(list[index],context),
                  separatorBuilder:(context,index) =>articleDivider() ,
                  itemCount: list.length),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
