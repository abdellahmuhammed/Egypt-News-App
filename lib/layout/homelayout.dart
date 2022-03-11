import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/bloc/cubit/newsapp_cubit.dart';
import 'package:news/layout/bloc/darkMode/cubit/darkmode_cubit.dart';
import 'package:news/modules/search/search.dart';
import 'package:news/shared/component.dart';


class HomeLayout extends StatelessWidget {
  const HomeLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsappCubit, NewsappState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('NewsApp'),
            actions: [
              IconButton(
                icon : Icon(Icons.add)
                icon: const Icon(Icons.search),
                onPressed: () {
                  NavigateTo(context, SearchScreen());
                },
              ),
              IconButton(
                icon: const Icon(Icons.light_mode),
                onPressed: () {
                  DarkModeCubit.get(context).AppChangeMode();
                },
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: NewsappCubit.get(context).bootom,
            currentIndex: NewsappCubit.get(context).CurrentIndex,
            onTap: (index) {
              NewsappCubit.get(context).ChangeBottomNavBar(index);
            },
          ),
          body: NewsappCubit.get(context)
              .screens[NewsappCubit.get(context).CurrentIndex],
        );
      },
    );
  }
}
