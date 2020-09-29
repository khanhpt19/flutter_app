import 'package:flutter_app/data/models/user_model.dart';

class UserEntity extends UserModel {
  UserEntity();
  factory UserEntity.fromModel(UserModel model) => UserEntity()
    ..id = model.id
    ..username = model.username
    ..password = model.password
    ..fullname = model.fullname
    ..country = model.country
    ..twitterAccount = model.twitterAccount
    ..age = model.age;
}
