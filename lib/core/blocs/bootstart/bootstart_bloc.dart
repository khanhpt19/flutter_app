import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/core/blocs/bases/bloc_base.dart';
import 'package:flutter_app/core/consts/enums.dart';
import 'package:flutter_app/core/utils/connectivity_utils.dart';
import 'package:flutter_app/domain/usecases/authentication/get_token.dart';
import 'package:flutter_app/domain/usecases/authentication/is_authenticated_user.dart';
import 'package:flutter_app/domain/usecases/movie/is_local_movie_empty.dart';
import 'package:flutter_app/domain/usecases/movie/movie_bootstart_sync.dart';
import 'package:flutter_app/domain/usecases/user/get_user_by_token.dart';
import 'package:injectable/injectable.dart';

import 'index.dart';

@lazySingleton
class BootStartBloc extends Bloc<BootstartEvent, BootStartState>
    with AppBlocBase {
  final ConnectivityUtils connectivityUtils;
  final IsAuthenticatedUser isAuthenticatedUser;
  final GetUserToken getToken;
  final GetUserByToken getAuthenticatedUser;
  final IsLocalMovieEmpty isLocalMovieEmpty;
  final MovieBootstartSync movieBootstartSync;

  BootStartBloc({
    @required this.connectivityUtils,
    @required this.isAuthenticatedUser,
    @required this.getToken,
    @required this.getAuthenticatedUser,
    @required this.isLocalMovieEmpty,
    @required this.movieBootstartSync,
  }) : super(UnBootstartState());

  @override
  Stream<BootStartState> mapEventToState(
    BootstartEvent event,
  ) async* {
    yield* event.applyAsync(currentState: state, bloc: this);
  }

  @override
  void toOnMessageState(String message, MessageType type) {
    this.add(BootstartEvent(
        toState: BootstartStateOnMessageState.fromOldSettingState(
            message: message, type: type)));
  }
}
