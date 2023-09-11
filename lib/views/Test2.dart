import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Test.dart';

import '../stateManage/stateManage.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ChangeNotifierProvider<ChangeMenuOptions>(create: (_) => ChangeMenuOptions()),
    ],
    child: XXX(),
  ),
);

class XXX extends StatelessWidget {
  const XXX({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WWW(),
    );
  }
}

class WWW extends StatefulWidget {
  const WWW({super.key});
  @override
  State<WWW> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<WWW> {
  @override
  Widget build(BuildContext context) {
    var x = [
      {
        '状态': ['冰(推荐)', '比较烫', '温',]
      },
      {
        '甜度': ['少糖', '少少糖', '多糖',]
      },
      {
        '冰量': ['推荐', '少冰', '少少冰','去冰',]
      },
      {
        '茶底': ['绿妍(推荐)', '百岁山(不推荐)', '去茶底',]
      },
      {
        '糖量': ['正常糖','少糖', '少少糖', '多糖',]
      },


    ];
    return OptionCardList(optionList: x,);
  }
}