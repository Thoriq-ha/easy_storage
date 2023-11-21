import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:storage_app/app/routes/app_pages.dart';

class QrcodeController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isPersmitted = false;
  Rx<Barcode> result = Barcode("", BarcodeFormat.codabar, []).obs;
  QRViewController? qrController;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    qrController?.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    qrController?.resumeCamera();
  }

  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      result.value = scanData;
      if (result.value.code != null) {
        scan();
        qrController?.pauseCamera();
      }
    });
    qrController?.resumeCamera();
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    isPersmitted = p;
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  scan() async {
    try {
      print(result.value.code);
      if (result.value.code ==
          'https://support.lenovo.com/qrcode?sn=PF25K6QT&mtm=81LK018KID') {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar('Failed', 'Failed to scanning qr code');
        qrController?.resumeCamera();
      }
    } catch (e) {
      print('error message $e');
    }
  }
}
