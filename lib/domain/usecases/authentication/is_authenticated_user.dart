import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/core/failures/failure.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:flutter_app/domain/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

/// [IsAuthenticatedUser] returns true, If he/she was singin before.
@lazySingleton
class IsAuthenticatedUser implements UseCase<bool, NoParams> {
  Repository repository;

  IsAuthenticatedUser({@required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.hasToken();
  }
}
