import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/core/failures/failure.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:flutter_app/domain/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

/// [ClearUserToken] clears user token from the local dbs.
@lazySingleton
class ClearUserToken implements UseCase<bool, NoParams> {
  Repository repository;

  ClearUserToken({@required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.clearToken();
  }
}
