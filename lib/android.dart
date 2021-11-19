import 'package:flutter/material.dart';
import 'package:social_app/src/application/store.dart';
import 'package:social_app/src/presentation/flutter_android/main.dart';
import 'package:flutter/rendering.dart';

Future<void> main() async {
  final store = createStore();

  debugPaintSizeEnabled = false;

  runApp(
    SaAndroidApp(store: store),
  );
}
