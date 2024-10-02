import 'package:bloc_flutter/bloc/movie_blocs/movie_bloc.dart';
import 'package:bloc_flutter/config/routes/routes_name.dart';
import 'package:bloc_flutter/main.dart';
import 'package:bloc_flutter/services/storage/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/enums.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late MovieBloc movieBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieBloc = MovieBloc(moviesRepository: getIt());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    movieBloc.close();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            LocalStorage localStorage = LocalStorage();

            localStorage.clearValue('token').then((val) {
              localStorage.clearValue('isLogin').then((val) {
                Navigator.pushNamed(context, RoutesName.loginScreen);
              });
            });
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: BlocProvider(
        create: (context) => movieBloc..add(MoviesFetched()),
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {

            switch(state.moviesList.status){
              case Status.loading:
                return Center(child: CircularProgressIndicator(),);
              case Status.error:
                return Center(child: Text(state.moviesList.message.toString()));
              case Status.completed:
                if(state.moviesList.data == null){
                  return Text('No data');
                }

                final movieList = state.moviesList.data!;

                return ListView.builder(
                  itemCount: movieList.tvShows.length,
                    itemBuilder: (ctx,i){
                      final tvShow = movieList.tvShows[i];
                      return Card(
                        child: ListTile(
                          title: Text(tvShow.name.toString()),
                          subtitle: Text(tvShow.network.toString()),
                          trailing: Text(tvShow.status),
                        ),
                      );
                    });
              default:
                return SizedBox();

            }
          },
        ),
      ),
    );
  }
}
