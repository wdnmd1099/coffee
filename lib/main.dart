import 'dart:convert';

import 'package:coffee/views/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screen/bottomNavigationBar.dart';
import 'stateManage/stateManage.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<MaskDiaLog>(create: (_) => MaskDiaLog()),
        ChangeNotifierProvider<BottomNavigationBarIndex>(create: (_) => BottomNavigationBarIndex()),
      ],
      child: MyApp(),
    ),
  );

  // checkLogin();

}

bool yes = false;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLogin().then((loggedIn) {
      setState(() {
        isLoggedIn = loggedIn;
      });
      if (isLoggedIn) {
        //context来自initState方法的参数，因为initState方法是StatefulWidget的方法之一，它的参数包括BuildContext类型的context。
        //至于listen参数，它是Provider.of方法的一个可选参数，用于控制是否订阅状态的变化。当listen为false时，表示不需要在状态变化时重新构建UI，默认为true。在这种情况下，我们只是调用了login方法，而没有依赖于状态变化来重新构建UI，所以将listen设置为false可以提高性能
        Provider.of<AuthProvider>(context, listen: false).login();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Named Routes Demo',
      initialRoute: '/bottomNavigationBar',
      routes: {
        '/bottomNavigationBar': (context) => bottomNavigationBar(),
      },
    );
  }
}

Future<bool> checkLogin() async {
  var token = await getToken();
  print('这是token：$token');
  if(token == null){return false;}
  else{
    var response = await http.get(
      Uri.parse('http://192.168.0.3:31000/RcApp/V1/Operator/GetInfo'),
      headers: {
        'X-API-TOKEN': '$token',
      },
    );
    if(response.body != null){
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print('登录代码(非0表示登录失败)：${jsonMap['Code']}');
      if (jsonMap['Code'] == 0) {
        return true;
      }
    }
    return false;
  }

}

