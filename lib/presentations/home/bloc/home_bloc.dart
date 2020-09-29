import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/core/blocs/bases/bloc_base.dart';
import 'package:flutter_app/core/consts/enums.dart';
import 'package:flutter_app/domain/entities/movie_entity.dart';
import 'package:flutter_app/domain/usecases/movie/get_local_movie_list.dart';
import 'package:flutter_app/domain/usecases/movie/search_movie_by_title.dart';
import 'package:injectable/injectable.dart';

import 'index.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> with AppBlocBase {
  final GetLocalMovieList getLocalMovieList;
  final SearchMovieByTitle searchMovieByTitle;

  HomeBloc(
      {@required this.getLocalMovieList, @required this.searchMovieByTitle})
      : super(UnHomeState(movieList: <MovieEntity>[], selectedMovie: null));

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    yield* event.applyAsync(currentState: state, bloc: this);
  }

  @override
  void toOnMessageState(String message, MessageType type) {
    this.add(HomeEvent(
        toState: HomeOnMessageState.fromOldState(state,
            type: type, message: message)));
  }
}
