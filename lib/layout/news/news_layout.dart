import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/layout/news/news_cubit.dart';
import 'package:flutter_news_app/layout/news/news_states.dart';
import 'package:flutter_news_app/modules/search_news/search_screen.dart';
import 'package:flutter_news_app/shared/cubit/cubit.dart';

import '../../shared/components/components.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
              iconTheme: IconThemeData(
                color: Colors.black, // <-- SEE HERE
              ),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeDarkMode();
                  },
                  icon: Icon(Icons.brightness_4_outlined))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              cubit.changeBottomNav(value);
            },
            currentIndex: cubit.currentIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business), label: 'Business'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports), label: 'Sports'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science), label: 'Science'),
            ],
            type: BottomNavigationBarType.fixed,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
