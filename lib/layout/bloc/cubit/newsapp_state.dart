// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

part of 'newsapp_cubit.dart';

@immutable
abstract class NewsappState {}

class NewsappInitial extends NewsappState {}

class NewsappChangeBottomNavBarstate extends NewsappState {}

//business state

class LoadingBusinessDataState extends NewsappState {}

class GetBusinessDataSuccessState extends NewsappState {}

class GetBusinessDataErrorState extends NewsappState {
  final OnError;

  GetBusinessDataErrorState(this.OnError);
}

//Sports state

class LoadingSportsDataState extends NewsappState {}

class GetSportsDataSuccessState extends NewsappState {}

class GetSportsDataErrorState extends NewsappState {
  final onError;

  GetSportsDataErrorState(this.onError);
}

//Science state

class LoadingScienceDataState extends NewsappState {}

class GetScienceDataSuccessState extends NewsappState {}

class GetScienceDataErrorState extends NewsappState {
  final OnError;

  GetScienceDataErrorState(this.OnError);
}


//Search state

class LoadingSearchDataState extends NewsappState {}

class GetSearchDataSuccessState extends NewsappState {}

class GetSearchDataErrorState extends NewsappState {
  final OnError;

  GetSearchDataErrorState(this.OnError);

}