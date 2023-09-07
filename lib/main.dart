import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/bottomNavigationBar.dart';


void main() {
  runApp(
    ChangeNotifierProvider<AuthProvider>(
      create: (_) => AuthProvider(),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Named Routes Demo',
      initialRoute: '/bottomNavigationBar',
      routes: {
        '/bottomNavigationBar': (context) => const bottomNavigationBar(),
      },
    );
  }
}


class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    // 登录逻辑
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    // 登出逻辑
    _isLoggedIn = false;
    notifyListeners();
  }
}