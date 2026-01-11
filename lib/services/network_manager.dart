import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:s_store/utils/constants/text_strings.dart';
import 'package:s_store/utils/popups/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();

  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  final Rx<ConnectivityResult> connectionStatus = ConnectivityResult.none.obs;

  Future<void> _updateConnectionStatusFromList(
      List<ConnectivityResult> results) async {
    final hasAnyActive = results.any((r) => r != ConnectivityResult.none);

    if (!hasAnyActive) {
      connectionStatus.value = ConnectivityResult.none;
      SSLoaders.warningSnackBar(title: SSAppStrings.checkInternet);
    } else {
      final firstActive = results.firstWhere(
          (r) => r != ConnectivityResult.none,
          orElse: () => ConnectivityResult.none);
      connectionStatus.value = firstActive;
    }
  }

  @override
  void onInit() {
    super.onInit();

    _checkInitialConnectivity();

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (List<ConnectivityResult> results) async {
        await _updateConnectionStatusFromList(results);
      },
      onError: (err) {},
    );
  }

  Future<void> _checkInitialConnectivity() async {
    try {
      final List<ConnectivityResult> results =
          await _connectivity.checkConnectivity();
      await _updateConnectionStatusFromList(results);
    } on PlatformException {
      connectionStatus.value = ConnectivityResult.none;
    }
  }

  Future<bool> isConnected() async {
    try {
      final List<ConnectivityResult> results =
          await _connectivity.checkConnectivity();

      return results.any((r) => r != ConnectivityResult.none);
    } on PlatformException {
      return false;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription?.cancel();
    super.onClose();
  }
}
