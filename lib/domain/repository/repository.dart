library repository;

import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/core/failures/failure.dart';
import 'package:flutter_app/core/utils/connectivity_utils.dart';
import 'package:flutter_app/data/local/datasources/movie_local_datasource.dart';
import 'package:flutter_app/data/local/datasources/user_local_datasource.dart';
import 'package:flutter_app/data/models/movie_model.dart';
import 'package:flutter_app/data/network/datasources/movie_omdb_datasource.dart';
import 'package:flutter_app/data/sharedpref/datasources/authentication_datasource.dart';
import 'package:flutter_app/domain/entities/movie_entity.dart';
import 'package:flutter_app/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

part 'authentication_repository.dart';
part 'movie_repository.dart';
part 'repository_utils.dart';
part 'user_repository.dart';

/// [RepositoryDependencies] contains the dependencies for the [Repository].
@lazySingleton
class RepositoryDependencies {
  final ConnectivityUtils connectivityUtils;
  final AuthenticationDataSource authenticationDataSource;
  final UserLocalDataSource userLocalDataSource;
  final MovieOmdbDataSource movieOmdbDataSource;
  final MovieLocalDataSource movieLocalDataSource;

  RepositoryDependencies(
      {@required this.connectivityUtils,
      @required this.authenticationDataSource,
      @required this.userLocalDataSource,
      @required this.movieOmdbDataSource,
      @required this.movieLocalDataSource});
}

/// [Repository] connects to the services/datasources which are in the [RepositoryDependencies] for api/local data operations.
@lazySingleton
class Repository {
  RepositoryDependencies d;
  Repository({@required this.d});
}
