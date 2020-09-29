import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/core/failures/failure.dart';
import 'package:flutter_app/domain/entities/movie_entity.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:flutter_app/domain/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

/// [GetLocalMovieList] get all movie list from local dbs
@lazySingleton
class GetLocalMovieList implements UseCase<List<MovieEntity>, NoParams> {
  Repository repository;

  GetLocalMovieList({@required this.repository});

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParams params) async {
    return await repository.getLocalMovieList();
  }
}
