import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:storage_app/app/data/models/history.dart';
import 'package:storage_app/app/data/models/user.dart';
import 'package:storage_app/app/global/controllers/app_controller.dart';

class UserService {
  static UserService? _userServices;

  static UserService get instance {
    _userServices ??= UserService._();
    return _userServices!;
  }

  UserService._();

  Future<User> signIn(User user) async {
    final data =
        await FirebaseFirestore.instance.collection('users').doc(user.id).get();
    if (data.exists) {
      // int saldo = data.data()!['saldo'];
      int saldo = 10000;
      Map<String, dynamic> userMap = user.toMap();
      userMap['saldo'] = saldo;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.id)
          .set(userMap);
      return user..saldo = saldo;
    } else {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.id)
          .set(user.toMap());
      return user;
    }
  }

  Future<List<Map<String, dynamic>>> getListSlot() async {
    final data = await FirebaseFirestore.instance.collection('slot').get();
    var docs = data.docs.map((e) => e).toList();
    docs.sort((a, v) =>
        (int.tryParse(a.id) ?? 0).compareTo((int.tryParse(v.id) ?? 0)));
    return docs.map((e) => e.data()).toList();
  }

  Future<bool> setId(int id, String method) async {
    final data = await FirebaseFirestore.instance
        .collection('slot')
        .doc(id.toString())
        .get();
    if (data.data()?['id'] != null) {
      return false;
    }

    await Future.wait([
      FirebaseFirestore.instance.collection('slot').doc(id.toString()).set(
          {'id': Get.find<AppController>().user!.id}, SetOptions(merge: true)),
      FirebaseFirestore.instance.collection('history').add({
        'id': Get.find<AppController>().user!.id,
        'title': "Slot $id Payment",
        'method': method,
        'value': '-',
        'price': data.data()?['price'],
        'date': Timestamp.now()
      }),
    ]);
    if (method == 'wallet') {
      Get.find<AppController>().user =
          User.fromMap(Get.find<AppController>().user!.toMap())
            ..saldo -= int.parse(data.data()?['price'].toString() ?? '0');
      FirebaseFirestore.instance
          .collection('users')
          .doc(Get.find<AppController>().user!.id)
          .set({'saldo': Get.find<AppController>().user!.saldo},
              SetOptions(merge: true));
    }
    return true;
  }

  Future<bool> deleteSlot(int id) async {
    try {
      await FirebaseFirestore.instance
          .collection('slot')
          .doc(id.toString())
          .set({'id': null}, SetOptions(merge: true));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<History>> getHistory() async {
    final result = await FirebaseFirestore.instance
        .collection('history')
        .where('id', isEqualTo: Get.find<AppController>().user!.id)
        .get();
    return result.docs.map((e) => History.fromMap(e.data())).toList();
  }
}
