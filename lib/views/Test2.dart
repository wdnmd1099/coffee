import 'package:flutter/material.dart';
import 'Test.dart';

void main() => runApp(XXX());

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
  State<WWW> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<WWW> {
  @override
  Widget build(BuildContext context) {
    var x = [
      [
        {
          '状态': [
            '冰(推荐)',
            '比较烫',
            '温',
          ]
        },
        {
          '冰量': [
            '推荐',
            '少冰',
            '少少冰',
            '去冰',
          ]
        },
        {
          '茶底': [
            '绿妍(推荐)',
            '百岁山(不推荐)',
            '去茶底',
          ]
        },
        {
          '糖量': [
            '正常糖',
            '少糖',
            '少少糖',
            '多糖',
          ]
        },
        {
          '加大料': [
            '八角',
            '话梅',
            '陈皮',
            '桂皮',
          ]
        },
      ],
      [ {
        '状态': ['冰(推荐)', '比较烫', '温'],
      },
        {
          '茶底': [
            '绿妍(推荐)',
            '百岁山(不推荐)',
            '去茶底',
          ],
        },
        {
          '糖量': [
            '正常糖',
            '少糖',
            '少少糖',
            '多糖',
          ],
        },
        {
          "加小料": [
            '红豆',
            '珍珠',
            '青稞',
            '什么冻',
          ],
        },],
      [ {
        '状态': ['冰(推荐)', '比较烫', '温'],
      },
        {
          '茶底': [
            '绿妍(推荐)',
            '百岁山(不推荐)',
            '去茶底',
          ],
        },
        {
          '糖量': [
            '正常糖',
            '少糖',
            '少少糖',
            '多糖',
          ],
        },
        {
          "加小料": [
            '红豆',
            '珍珠',
            '青稞',
            '什么冻',
          ],
        },],
    ];
    return OptionCardList(
      optionList: x,
      sameMode: true,
      changeOption: '状态',
      btnTitle: '加入购物车',
    );
  }
}
