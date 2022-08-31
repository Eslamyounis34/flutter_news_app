import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/layout/news/news_cubit.dart';
import 'package:flutter_news_app/layout/news/news_states.dart';

import '../../shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var scienceist = NewsCubit
              .get(context)
              .scienceList;
          return BuildCondition(
            condition:state is! GetScienceNewsLoadingState,
            builder: (context) =>
                ListView.separated(itemBuilder: (context, index) =>
                    buildArticleItem(scienceist[index]),
                    separatorBuilder: (context,index) =>articleDivider(),
                    itemCount: scienceist.length),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        });
  }
}
