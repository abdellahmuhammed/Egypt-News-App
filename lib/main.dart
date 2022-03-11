import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/bloc/cubit/newsapp_cubit.dart';
import 'package:news/layout/bloc/darkMode/cubit/darkmode_cubit.dart';
import 'package:news/shared/network/local/sharedpreferences/sharedpreferences.dart';
import 'layout/homelayout.dart';
import 'shared/network/remote/diohelper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await sharedHelper.init();

  bool isDark = sharedHelper.GetData(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
    MyApp(this.isDark,) ;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsappCubit()..getDataBusiness()),
        BlocProvider(create: (context) => DarkModeCubit()..AppChangeMode(
          isDarkFromShared: isDark,
        ),
        ),
      ],
      child: BlocConsumer<DarkModeCubit, DarkmodeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.amber,
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                bodyText2: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                elevation: 20.0,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.black,
                unselectedIconTheme: IconThemeData(
                  color: Colors.grey[600],
                  size: 30.0,
                ),
                selectedIconTheme: const IconThemeData(
                  color: Colors.blue,
                  size: 30.0,
                ),
                unselectedLabelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal),
                selectedLabelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              appBarTheme: const AppBarTheme(
                titleSpacing: 20.0,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                bodyText2: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              scaffoldBackgroundColor: const Color.fromARGB(255, 71, 71, 71),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: const Color.fromARGB(255, 71, 71, 71),
                elevation: 20.0,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.white,
                unselectedIconTheme: IconThemeData(
                  color: const Color.fromARGB(255, 231, 179, 179),
                  size: 30.0,
                ),
                selectedIconTheme: IconThemeData(
                  color: Colors.blue,
                  size: 30.0,
                ),
                unselectedLabelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal),
                selectedLabelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              appBarTheme: const AppBarTheme(
                titleSpacing: 20.0,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color.fromARGB(255, 71, 71, 71),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: Color.fromARGB(255, 71, 71, 71),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: DarkModeCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home:  const HomeLayout(),
          );
        },
      ),
    );
  }
}
