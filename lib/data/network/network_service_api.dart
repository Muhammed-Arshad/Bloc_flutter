import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_flutter/data/exceptions/app_exceptions.dart';
import 'package:bloc_flutter/data/network/base_api_services.dart';

import 'package:http/http.dart' as http;

class NetworkServiceApi implements BaseApiServices{
  @override
  Future<dynamic> getApi(String url) async{

    dynamic jsonResponse;

    try{

      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 50));

      jsonResponse = returnResponse(response);

    }on SocketException{
      throw NoInternetConnection('No internet');
    }on TimeoutException{
      throw FetchDataException('Time out try again');
    }

    return jsonResponse;

  }

  @override
  Future<dynamic> postApi(String url, data) async{

    dynamic jsonResponse;

    try{
      print('lllll');
      final response = await http.post(Uri.parse(url),body: data).timeout(const Duration(seconds: 50));
      print('kkkk');
      jsonResponse = returnResponse(response);

    }on SocketException{
      print('gggggg');
      throw NoInternetConnection('No internet');
    }on TimeoutException{
      print('ffffff');
      throw FetchDataException('Time out try again');
    }

    return jsonResponse;

  }


  dynamic returnResponse(http.Response response){
    print(response.statusCode);
    switch(response.statusCode){
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 401:
        throw UnauthorizedException();
      case 500:
        throw FetchDataException('Error communicating with server');
    }
  }
}