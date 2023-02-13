import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/shared/components/components.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../layout/news/news_cubit.dart';
import '../../layout/news/news_states.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var sportsList = NewsCubit.get(context).sportsList;
          return ScreenTypeLayout(
            mobile: BuildCondition(
              condition: state is! GetSportsNewsLoadingState,
              builder: (context) => ListView.separated(
                  itemBuilder: (context, index) =>
                      buildArticleMobileItem(sportsList[index], context, index),
                  separatorBuilder: (context, index) => articleDivider(),
                  itemCount: sportsList.length),
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
                            buildArticleDesktopItem(
                                sportsList[index], context, index),
                        separatorBuilder: (context, index) => articleDivider(),
                        itemCount: sportsList.length),
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
                                  image: NetworkImage(sportsList.isEmpty
                                      ? 'https://cdn-icons-png.flaticon.com/512/3875/3875433.png'
                                      : sportsList[NewsCubit.get(context)
                                                      .businessSelectedItem]
                                                  ['urlToImage'] ==
                                              null
                                          ? 'https://cdn-icons-png.flaticon.com/512/3875/3875433.png'
                                          : '${sportsList[NewsCubit.get(context).businessSelectedItem]['urlToImage']}'),
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
                                  sportsList.isEmpty
                                      ? 'Select Article '
                                      : '${sportsList[NewsCubit.get(context).businessSelectedItem]['publishedAt']}',
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
                                    sportsList.isEmpty
                                        ? 'Select Article '
                                        : '${sportsList[NewsCubit.get(context).businessSelectedItem]['title']}',
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
                                    sportsList.isEmpty
                                        ? 'Select Article '
                                        : '${sportsList[NewsCubit.get(context).businessSelectedItem]['description']}',
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
          );
        });
  }
}
