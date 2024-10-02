import 'package:bloc_flutter/config/app_urls.dart';
import 'package:bloc_flutter/data/network/network_service_api.dart';
import 'package:bloc_flutter/repository/movies/movies_repository.dart';

import '../../model/movies/movies.dart';

class MoviesHttpApiRepository implements MoviesRepository{
  final _apiService = NetworkServiceApi();

  @override
  Future<MoviesModel> fetchMovieList() async{
    final response = await _apiService.getApi(AppUrls.movieListEndPoint);
    return MoviesModel.fromJson(response);
  }
}