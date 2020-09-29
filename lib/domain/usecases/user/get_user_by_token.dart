import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/core/failures/failure.dart';
import 'package:flutter_app/domain/entities/user_entity.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:flutter_app/domain/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

/// [GetUserByToken] get authenticated user if there is a user-token.
@lazySingleton
class GetUserByToken implements UseCase<UserEntity, NoParams> {
  Repository repository;

  GetUserByToken({@required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(NoParams noParams) async {
    final tokenResult = await this.repository.getToken();

    return tokenResult.fold<Future<Either<Failure, UserEntity>>>(
        (failure) => Future.value(Left(failure)),
        (token) async => await repository.getUserByToken(token));
  }
}
