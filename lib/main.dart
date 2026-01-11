import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {

  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  if (kDebugMode) {
    print('🟢 [MAIN] - Widgets binding initialized.');
  }

  await GetStorage.init();
  if (kDebugMode) {
    print('💾 [MAIN] - Local storage initialized.');
  }

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  if (kDebugMode) {
    print('⏳ [MAIN] - Splash screen preserved.');
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) {
    Get.put(AuthenticationRepository());
    if (kDebugMode) {
      print('🔥 [MAIN] - Firebase initialized & AuthenticationRepository injected.');
    }
  });

  await Supabase.initialize(
    url: '',
    anonKey: '',
  );
  runApp(const App());
  if (kDebugMode) {
    print('🚀 [MAIN] - App started successfully.');
  }
}