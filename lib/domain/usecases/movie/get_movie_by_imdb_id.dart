import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/core/failures/failure.dart';
import 'package:flutter_app/domain/entities/movie_entity.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:flutter_app/domain/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

/// [GetMovieByImdbID] get movie by imdb id
@lazySingleton
class GetMovieByImdbID implements UseCase<MovieEntity, Params> {
  Repository repository;

  GetMovieByImdbID({@required this.repository});

  @override
  Future<Either<Failure, MovieEntity>> call(Params params) async {
    return await repository.getMovieByImdbID(params.imdbID);
  }
}

class Params {
  final String imdbID;

  Params(this.imdbID);
}
