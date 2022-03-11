import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/bloc/cubit/newsapp_cubit.dart';
import '../../shared/component.dart';

class SportsScreen extends StatelessWidget
{
  const SportsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsappCubit, NewsappState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        var list = NewsappCubit.get(context).Sports;
        return ArticalItemBuilder(list , isSearch: false);
      },
    );
  }
}
