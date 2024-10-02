import 'package:bloc_flutter/config/app_urls.dart';
import 'package:bloc_flutter/data/network/network_service_api.dart';
import 'package:bloc_flutter/model/user/user_model.dart';

class LoginRepository{

  final _apiServices = NetworkServiceApi();

  Future<UserModel> loginApi(dynamic data) async{
    final response = await _apiServices.postApi(AppUrls.loginUrl, data);
    return UserModel.fromJson(response);
  }
}