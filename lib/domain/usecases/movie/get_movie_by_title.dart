import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/core/failures/failure.dart';
import 'package:flutter_app/domain/entities/movie_entity.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:flutter_app/domain/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

/// [GetMovieByTitle] get movie by title
@lazySingleton
class GetMovieByTitle implements UseCase<MovieEntity, Params> {
  Repository repository;

  GetMovieByTitle({@required this.repository});

  @override
  Future<Either<Failure, MovieEntity>> call(Params params) async {
    return await repository.getMovieByTitle(params.title);
  }
}

class Params {
  final String title;

  Params(this.title);
}
