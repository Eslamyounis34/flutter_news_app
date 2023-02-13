import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/news/news_cubit.dart';
import '../../layout/news/news_states.dart';
import '../../shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        // NewsCubit.get(context).getSearchData();
        var list = NewsCubit.get(context).searchList;
        print("list of search =" + list.toString());
        return Scaffold(
            appBar: AppBar(title: Text('Search')),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  defaultTextField(
                      controller: searchController,
                      type: TextInputType.text,
                      label: 'Search',
                      prefix: Icons.search,
                      onChange: (value) {
                        NewsCubit.get(context).getSearchData(value!);
                        print('searchResult : ' +
                            NewsCubit.get(context).searchList.toString());
                      },
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Search is empty';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            buildArticleMobileItem(list[index], context,index),
                        separatorBuilder: (context, index) => articleDivider(),
                        itemCount: list.length),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
