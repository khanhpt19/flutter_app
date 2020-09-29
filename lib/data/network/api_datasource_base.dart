import 'package:dio/dio.dart';
import 'package:flutter_app/data/network/dio_client.dart';
import 'package:flutter_app/data/network/network_consts.dart';

abstract class ApiDataSourceBase {
  DioClient _dioClient = DioClient();

  Dio get dio {
    return _dioClient.dio;
  }

  EndPoints get endPoints => NetworkConsts.endPoints;
}
