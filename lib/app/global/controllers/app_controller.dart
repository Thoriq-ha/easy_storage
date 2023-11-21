import 'package:get/get.dart';

import '../../data/models/user.dart';

class AppController extends GetxController {
  final Rx<User?> _user = Rx(User(
      email: "testing@gmail.com",
      id: "123456",
      name: "Andrew Asley",
      saldo: 100000,
      picture: "https://picsum.photos/200"));
  User? get user => _user.value;
  set user(User? user) {
    _user.value = null;
    _user.value = user;
  }
}
