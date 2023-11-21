import 'package:get/get.dart';

class InstructionController extends GetxController {
  final image = [
    'assets/instruction/1.png',
    'assets/instruction/2.png',
    'assets/instruction/3.png',
    'assets/instruction/4.png',
    'assets/instruction/5.png',
    'assets/instruction/6.png',
    'assets/instruction/7.png',
    'assets/instruction/8.png',
    'assets/instruction/9.png',
    'assets/instruction/10.png',
  ];
  final caption = [
    'Pilih slot box berwarna abu-abu pada aplikasi (available)',
    'Mesin akan automatis bergerak dan menyediakan ruang bagi pengguna',
    'Pengguna bisa memasukkan motor',
    'Pengguna menscanning fingerprint untuk alat keamanan',
    'Box akan automatis tertutup',
    'Pengguna memilih no slot box berwana biru',
    'Pengguna menscanning fingerprint untuk membuka keamanan box',
    'Pengguna memilih pembayaran',
    'Mesin bergerak dan mengeluarkan motor dari box secara automatis',
    'Pengguna bisa mengambil motor'
  ];

  final _index = 0.obs;
  int get index => _index.value;

  void onBack() {
    if (index == 0) {
      Get.back();
    } else {
      _index.value--;
    }
  }

  void onNext() {
    if (index == 9) {
      Get.back();
    } else {
      _index.value++;
    }
  }
}
