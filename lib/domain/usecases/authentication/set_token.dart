import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/core/failures/failure.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:flutter_app/domain/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

/// [SetUserToken] sets user-token to the local.
@lazySingleton
class SetUserToken implements UseCase<void, Params> {
  Repository repository;

  SetUserToken({@required this.repository});

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await repository.setToken(params.token);
  }
}

class Params {
  final String token;

  Params(this.token);
}
