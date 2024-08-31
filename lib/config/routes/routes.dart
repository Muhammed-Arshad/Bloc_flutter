import 'package:bloc_flutter/config/routes/routes_name.dart';
import 'package:flutter/material.dart';
import '../../views/views.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
            body: Center(
              child: Text('No route'),
            ),
          );
        });
    }
  }

}