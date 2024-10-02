import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/data/response/api_response.dart';
import 'package:equatable/equatable.dart';

import '../../model/movies/movies.dart';
import '../../repository/movies/movies_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MoviesRepository moviesRepository;
  MovieBloc({required this.moviesRepository}) : super(MovieState(moviesList: ApiResponse.loading())) {
    on<MoviesFetched>(_fetchMovieListApi);
  }

  Future<void> _fetchMovieListApi(MoviesFetched event, Emitter<MovieState> emit) async{
    await moviesRepository.fetchMovieList().then((val){
      emit(state.copyWith(moviesList: ApiResponse.completed(val)));
    }).onError((e,s){
      emit(state.copyWith(moviesList: ApiResponse.error(e.toString())));
    });
  }
}
