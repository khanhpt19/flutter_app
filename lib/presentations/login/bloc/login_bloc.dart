import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/core/blocs/bases/bloc_base.dart';
import 'package:flutter_app/core/consts/enums.dart';
import 'package:flutter_app/domain/usecases/authentication/set_token.dart';
import 'package:flutter_app/domain/usecases/user/do_login.dart';
import 'package:injectable/injectable.dart';

import 'index.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> with AppBlocBase {
  final DoLogin doLogin;
  final SetUserToken setToken;

  LoginBloc({@required this.doLogin, @required this.setToken})
      : super(UnLoginState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    yield* event.applyAsync(currentState: state, bloc: this);
  }

  @override
  void toOnMessageState(String message, MessageType type) {
    this.add(
      LoginEvent(
        toState: LoginOnMessageState.fromOldState(state,
            type: type, message: message),
      ),
    );
  }
}
