import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/bloc/cubit/newsapp_cubit.dart';
import 'package:news/shared/component.dart';

class SearchScreen extends StatelessWidget {
  var SerachController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsappCubit, NewsappState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsappCubit.get(context).Search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: defultTextFormFiled(
                  radius: 15,
                  controller: SerachController,
                  type: TextInputType.text,
                  label: 'Search',
                  prefixIcon: Icons.search,
                  onchange: (value){
                    NewsappCubit.get(context).getDataSearch(value);
                  },
                  validate: (value) {
                    return 'search must not be Empty';
                  },
                ),
              ),
              Expanded(child: ArticalItemBuilder(list , isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
