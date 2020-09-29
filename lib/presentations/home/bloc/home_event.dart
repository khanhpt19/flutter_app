import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/core/blocs/bases/bloc_event_base.dart';
import 'package:flutter_app/domain/entities/movie_entity.dart';
import 'package:flutter_app/domain/usecases/movie/search_movie_by_title.dart';
import 'package:flutter_app/domain/usecases/usecase.dart';

import 'index.dart';

class HomeEvent extends BlocEventBase<HomeState, HomeBloc> {
  HomeEvent({HomeState toState}) : super(toState: toState);
}

class LoadLocalMovieListEvent extends HomeEvent {
  @override
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async* {
    yield HomeInProgressState.fromOldState(currentState);
    List<MovieEntity> movieList =
        bloc.extractEither(await bloc.getLocalMovieList(NoParams()));
    //bloc.extractEither(await bloc.clearLocalMovieList(NoParams()));
    yield HomeLoaddedState.fromOldState(currentState, movieList: movieList);
  }
}

class SearchMovieByTitleEvent extends HomeEvent {
  final String title;

  SearchMovieByTitleEvent({@required this.title});

  @override
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async* {
    yield HomeInProgressState.fromOldState(currentState);
    List<MovieEntity> movieList =
        bloc.extractEither(await bloc.searchMovieByTitle(Params(title)));
    //bloc.extractEither(await bloc.clearLocalMovieList(NoParams()));
    yield HomeLoaddedState.fromOldState(currentState, movieList: movieList);
  }
}
