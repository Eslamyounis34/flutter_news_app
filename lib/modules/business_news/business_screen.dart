import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/layout/news/news_cubit.dart';
import 'package:flutter_news_app/layout/news/news_states.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).businessList;
      //  var currentIndex=NewsCubit.get(context).businessSelectedItem;
      //  var testData=list[NewsCubit.get(context).businessSelectedItem]['description'];
       // print("APIDATA"+testData.toString());
        print("list of business =" + list.toString());
        return ScreenTypeLayout(
          mobile: BuildCondition(
            condition: state is! GetBusinessNewsLoadingState,
            builder: (context) => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildArticleItem(list[index], context, index),
                separatorBuilder: (context, index) => articleDivider(),
                itemCount: list.length),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
          desktop: Row(
            children: [
              Container(
                width: 450,
                child: BuildCondition(
                  condition: state is! GetBusinessNewsLoadingState,
                  builder: (context) => ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildArticleItem(list[index], context, index),
                      separatorBuilder: (context, index) => articleDivider(),
                      itemCount: list.length),
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ),
              Expanded(
                  child: Container(
                    color: Colors.grey[100],
                    child: Column(

                children: [
                    Text('${list[NewsCubit.get(context).businessSelectedItem]['description']}'),
                ],
              ),
                  ))
            ],
          ),
          breakpoints: ScreenBreakpoints(desktop: 800, tablet: 600, watch: 100),
        );
      },
    );
  }
}
