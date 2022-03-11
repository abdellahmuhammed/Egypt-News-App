
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/shared/network/local/sharedpreferences/sharedpreferences.dart';

part 'darkmode_state.dart';

class DarkModeCubit extends Cubit<DarkmodeState> {
  DarkModeCubit() : super(DarkmodeInitial());

  static DarkModeCubit get(context) => BlocProvider.of(context);

/*var IconIsDark = false;

  void ChangeIconeMode() {
    IconIsDark = !IconIsDark;

    emit(ChangeIconeModeState());
  }*/

  var isDark = false;
  void AppChangeMode({bool isDarkFromShared}) {

    if (isDarkFromShared != null){
      isDark = isDarkFromShared;
      emit(AppChangeModeState());
    }
    else {
      isDark =!isDark;
      sharedHelper.PutData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      }).catchError((onError){
        print('Error Happened ${onError.toString()}');
      });
    }


  }
}
