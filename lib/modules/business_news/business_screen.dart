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
        //  var testData=list[NewsCubit.get(context).businessSelectedItem]['description'];
        // print("APIDATA"+testData.toString());
        return ScreenTypeLayout(
          mobile: BuildCondition(
            condition: state is! GetBusinessNewsLoadingState,
            builder: (context) => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildArticleMobileItem(list[index], context, index),
                separatorBuilder: (context, index) => articleDivider(),
                itemCount: list.length),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
          desktop: Row(
            children: [
              Container(
                width: 380,
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
                  child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      //'${list[NewsCubit.get(context).businessSelectedItem]['urlToImage']}'
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(list.isEmpty
                                    ? 'https://cdn-icons-png.flaticon.com/512/3875/3875433.png'
                                    : list[NewsCubit.get(context)
                                                    .businessSelectedItem]
                                                ['urlToImage'] ==
                                            null
                                        ? 'https://cdn-icons-png.flaticon.com/512/3875/3875433.png'
                                        : '${list[NewsCubit.get(context).businessSelectedItem]['urlToImage']}'),
                                fit: BoxFit.fill)),
                        width: double.infinity,
                        height: 400,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16, top: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                list.isEmpty
                                    ? 'Select Article '
                                    : '${list[NewsCubit.get(context).businessSelectedItem]['publishedAt']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                  list.isEmpty
                                      ? 'Select Article '
                                      : '${list[NewsCubit.get(context).businessSelectedItem]['title']}',
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Cairo',
                                      color: Colors.black)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                  list.isEmpty
                                      ? 'Select Article '
                                      : '${list[NewsCubit.get(context).businessSelectedItem]['description']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.grey)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
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
