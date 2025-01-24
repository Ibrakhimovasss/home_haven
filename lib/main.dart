import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_haven/providers/provide.dart';
import 'package:provider/provider.dart';
import 'package:home_haven/presentations/screens/login_screen.dart';
import 'package:home_haven/presentations/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove("token");
  log(prefs.getString("token") ?? "Token is not saved yet!");
  runApp(MyApp(
    token: prefs.getString("token"),
  ));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FurnitureProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: token != null ? SplashScreen() : const LoginScreen(),
          routes: {
            '/login': (context) => const LoginScreen(),
            '/splash': (context) => const SplashScreen(),
          },
        ),
      ),
    );
  }
}
