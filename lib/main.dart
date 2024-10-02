import 'package:bloc_flutter/config/routes/routes_name.dart';
import 'package:bloc_flutter/repository/auth/login_repository.dart';
import 'package:bloc_flutter/repository/movies/movies_http_api_repository.dart';
import 'package:bloc_flutter/repository/movies/movies_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'config/routes/routes.dart';

GetIt getIt = GetIt.instance;

void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

void serviceLocator(){
  getIt.registerLazySingleton<LoginRepository>(()=> LoginRepository());
  getIt.registerLazySingleton<MoviesRepository>(()=> MoviesHttpApiRepository());
}


