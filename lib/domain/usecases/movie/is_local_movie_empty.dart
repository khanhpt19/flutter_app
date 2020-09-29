import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/core/failures/failure.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:flutter_app/domain/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

/// [IsLocalMovieEmpty] return true if there is no movie-data on local db
@lazySingleton
class IsLocalMovieEmpty implements UseCase<bool, NoParams> {
  Repository repository;

  IsLocalMovieEmpty({@required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.isLocalMovieEmpty();
  }
}
