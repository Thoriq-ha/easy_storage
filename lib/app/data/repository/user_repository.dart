import 'dart:convert';

import 'package:get/get.dart';
import 'package:storage_app/app/data/models/user.dart';
import 'package:storage_app/app/data/service/shared_preferences_service.dart';
import 'package:storage_app/app/data/service/user_service.dart';
import 'package:storage_app/app/global/controllers/app_controller.dart';

import '../models/history.dart';

class UserRepository {
  static UserRepository? _userRepository;

  static UserRepository get instance {
    _userRepository ??= UserRepository._();
    return _userRepository!;
  }

  UserRepository._();

  Future<void> signIn(
      {required String id,
      required String email,
      required String name,
      required String photo}) async {
    User user =
        User(email: email, id: id, name: name, saldo: 100000, picture: photo);
    final syncUser = await UserService.instance.signIn(user);
    Get.find<AppController>().user = syncUser;
    SharedPreferencesService.instance
        .setString('user', json.encode(syncUser.toMap()));
  }

  Future<List<Map<String, dynamic>>> getListSlot() =>
      UserService.instance.getListSlot();

  Future<bool> setId(int id, String method) =>
      UserService.instance.setId(id, method);

  Future<bool> deleteSlot(int id) => UserService.instance.deleteSlot(id);
  Future<List<History>> getHistory() => UserService.instance.getHistory();
}
