import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/layout/news/news_layout.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_app/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:flutter_news_app/shared/cubit/cubit.dart';
import 'package:flutter_news_app/shared/cubit/states.dart';
import 'package:flutter_news_app/shared/data/local/chache_helper.dart';
import 'package:flutter_news_app/shared/data/remote/dio_helper.dart';
import 'package:flutter_news_app/shared/styles.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'layout/news/news_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isMacOS) await DesktopWindow.setMinWindowSize(Size(800, 650));
  DioHelper.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.getData(key: 'isDark') ?? false;

  runApp(MyApp(isDark!));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp(this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..getBusinessData()),
        BlocProvider(
            create: (context) =>
                AppCubit()..changeDarkMode(fromShared: isDark)),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          title: 'Flutter Demo',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode:
              AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: NewsScreen(),
          ),
        ),
      ),
    );
  }
}
