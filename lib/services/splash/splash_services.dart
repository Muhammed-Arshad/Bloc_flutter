import 'dart:async';

import 'package:bloc_flutter/config/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';

class SplashServices{

  void isLogin(BuildContext context){
    Timer(const Duration(seconds: 3) ,
        ()=> Navigator.pushNamedAndRemoveUntil(context,RoutesName.loginScreen,
            (route)=> false));
}

}