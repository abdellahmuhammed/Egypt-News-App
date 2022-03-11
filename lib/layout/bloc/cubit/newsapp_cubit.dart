import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/science/science.dart';
import 'package:news/shared/network/remote/diohelper.dart';

import '../../../modules/business/business.dart';
import '../../../modules/sports/sports.dart';


part 'newsapp_state.dart';

class NewsappCubit extends Cubit<NewsappState> {
  NewsappCubit() : super(NewsappInitial());

  static NewsappCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> bootom = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: 'business'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports_bar_sharp), label: 'sports'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science_rounded), label: 'science'),
  ];

  int CurrentIndex = 0;

  void ChangeBottomNavBar(int index) {
    CurrentIndex = index;
    if(index == 1) {
      getDataSports();
    }
    if(index == 2) {
      getDataScience();
    }

    emit(NewsappChangeBottomNavBarstate());
  }

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];


  List<dynamic> Business = [];

  void getDataBusiness() {
    emit(LoadingBusinessDataState());
    DioHelper.GetData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '37ae90fa47764c9c8d342af34258b7ed',
    }).then((value) {
      Business = value.data['articles'];
      print(Business);
      emit(GetBusinessDataSuccessState());
    }).catchError((onError) {
      print(
          'When getting data of Business error happened  ${onError.toString()}');
      emit(GetBusinessDataErrorState(onError));
    });
  }


  List<dynamic> Sports = [];

  void getDataSports() {
    emit(LoadingSportsDataState());
    if (Sports.isEmpty ){
      DioHelper.GetData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'Sports',
        'apiKey': '37ae90fa47764c9c8d342af34258b7ed',
      }).then((value) {
        Sports = value.data['articles'];
        print(Sports);
        emit(GetSportsDataSuccessState());
      }).catchError((onError) {
        print(
            'When getting data of Sports error happened  ${onError.toString()}');
        emit(GetSportsDataErrorState(onError));
      });
    }
    else{
      emit(GetSportsDataSuccessState());
    }

  }



  List<dynamic> Science = [];

  void getDataScience() {
    emit(LoadingScienceDataState());
    if (Science.isEmpty){
      DioHelper.GetData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '37ae90fa47764c9c8d342af34258b7ed',
      }).then((value) {
        Science = value.data['articles'];
        print(Science);
        emit(GetScienceDataSuccessState());
      }).catchError((onError) {
        print(
            'When getting data of Science error happened  ${onError.toString()}');
        emit(GetScienceDataErrorState(onError));
      });
    }
    else {
      emit(GetScienceDataSuccessState());
    }
  }

  List<dynamic> Search = [];

  void getDataSearch(value) {
    emit(LoadingSearchDataState());
    Search =[];
    DioHelper.GetData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '37ae90fa47764c9c8d342af34258b7ed',
    }).then((value) {
      Search = value.data['articles'];
      print(Search);
      emit(GetSearchDataSuccessState());
    }).catchError((onError) {
      print(
          'When getting data of Search error happened  ${onError.toString()}');
      emit(GetSearchDataErrorState(onError));
    });
  }
}
