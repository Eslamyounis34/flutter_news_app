import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/shared/components/components.dart';

import '../../layout/news/news_cubit.dart';
import '../../layout/news/news_states.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var sportsList = NewsCubit
              .get(context)
              .sportsList;
          return BuildCondition(
            condition:state is! GetSportsNewsLoadingState,
            builder: (context) =>
                ListView.separated(itemBuilder: (context, index) =>
                    buildArticleItem(sportsList[index]),
                    separatorBuilder: (context,index) =>articleDivider(),
                    itemCount: sportsList.length),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        });
  }

}