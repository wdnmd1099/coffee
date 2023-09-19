import 'package:coffee/views/takeFoodPage.dart';
import 'package:flutter/material.dart';
import 'package:coffee/views/homePage.dart';
import 'package:coffee/views/orderPage.dart';
import 'package:coffee/views/userPage.dart';
import 'package:provider/provider.dart';

import '../stateManage/stateManage.dart';

class bottomNavigationBar extends StatefulWidget {
  bottomNavigationBar({
    super.key,
  });

  List piece = [
    {'Icon': Icons.home, 'title': '首页'},
    {'Icon': Icons.library_books, 'title': '点餐'},
    {'Icon': Icons.insert_drive_file, 'title': '取餐'},
    {'Icon': Icons.account_balance_wallet, 'title': '卡券'},
    {'Icon': Icons.accessibility_new, 'title': '我的'},
  ];

  @override
  State<bottomNavigationBar> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<bottomNavigationBar> {
  int _selectedIndex = 0;
  List<Widget> x = [];
  @override
 initState() {
    super.initState();
    void tes(){
      setState(() {
        _selectedIndex = 4;
      });
    }
    //初始化控制器进入页面的时候显示哪个页面
    x = <Widget>[
      //初始化过程中无法访问函数
      HomePage(), //首页

      OrderPage(),
      TakeFood(setIndex:tes,),
      // Center(child: Text('未开发此页面'),),Center(child: Text('未开发此页面'),)
      Center(
        child: Text('未开发此页面'),
      ),

      UserPage(),
    ];
  }



  final ExpansionTileController ETCcontroller =
      ExpansionTileController(); //折叠组件的controller

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    bool refresh = false;
    print(x);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.greenAccent,
          highlightColor: Color.fromRGBO(0, 0, 0, 0),
          splashColor: Color.fromRGBO(0, 0, 0, 0)),
      home: Scaffold(
        body: Container(
          height: maxHeight,
          width: maxWidth,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.grey[200],
                  child: IndexedStack(
                    index: _selectedIndex,
                    children:x,
                  ),
                ),
              ),
              Container(
                // alignment: Alignment.bottomCenter,
                height: maxHeight * 0.08,
                width: maxWidth,
                color: Colors.white,
                child: Row(
                  children: [
                    for (int i = 0; i < widget.piece.length; i++)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = i;
                          });
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: maxHeight * 0.08,
                          width: maxWidth / widget.piece.length,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  widget.piece[i]['Icon'],
                                  size: 20,
                                  color: test(i, _selectedIndex),
                                ),
                                Text(
                                  '${widget.piece[i]['title']}',
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: test(i, _selectedIndex),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  test(int i, _selectedIndex) {
    if (i == _selectedIndex) {
      return Colors.blue;
    } else {
      return Colors.grey;
    }
  }
}
