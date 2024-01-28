import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:food_store/app.dart';
import 'package:food_store/firebase_options.dart';

Future<void> main() async {
  /// widgets binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  /// await splash screen until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// initialize firebase and authentication repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => FlutterNativeSplash.remove());      

  runApp(const App());
}
