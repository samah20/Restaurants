import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants/firestore/data/router_helper.dart';
import 'package:restaurants/firestore/providers/app_provider.dart';
import 'package:restaurants/firestore/ui/screen/intro/splach_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider(),
      child: MaterialApp(
        navigatorKey: RouterHelper.routerHelper.routerKey,
        home: SplachScreen(),
      )));
}
