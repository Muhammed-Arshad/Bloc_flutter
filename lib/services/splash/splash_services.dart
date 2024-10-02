import 'dart:async';

import 'package:bloc_flutter/config/routes/routes_name.dart';
import 'package:bloc_flutter/services/session_manager/session_controller.dart';
import 'package:flutter/cupertino.dart';

class SplashServices{

  void isLogin(BuildContext context){

    SessionController().getUserFromPreference().then((val){

      if(SessionController().isLogin ?? false){
        Timer(const Duration(seconds: 3) ,
                ()=> Navigator.pushNamedAndRemoveUntil(context,RoutesName.homeScreen,
                    (route)=> false));
      }else{
        Timer(const Duration(seconds: 3) ,
                ()=> Navigator.pushNamedAndRemoveUntil(context,RoutesName.loginScreen,
                    (route)=> false));
      }

    }).onError((e,s){
      Timer(const Duration(seconds: 3) ,
              ()=> Navigator.pushNamedAndRemoveUntil(context,RoutesName.loginScreen,
                  (route)=> false));
    });


}

}