import 'package:coffee/views/takeFoodPage.dart';
import 'package:flutter/material.dart';
import 'package:coffee/views/homePage.dart';
import 'package:coffee/views/orderPage.dart';
import 'package:coffee/views/userPage.dart';
import 'package:provider/provider.dart';

import '../stateManage/stateManage.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({super.key});

  @override
  State<bottomNavigationBar> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<bottomNavigationBar> {
  int _selectedIndex = 0;

  void setIndex4(){
    setState(() {
      _selectedIndex = 4;
    });
  }
  void toOrderPage(){
    setState(() {
      _selectedIndex = 1;
    });
  }


  List<Widget> bottonViews(BuildContext context, ETCcontroller) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;

    List<Widget> widgetOptions = <Widget>[
      HomePage(toOrderPage: toOrderPage,), //首页

      OrderPage(),

      TakeFood(setIndex: setIndex4,),

      Center(child: Text('未开发此页面'),),

      UserPage(),
    ];
    return widgetOptions;
  }

  List<Widget> widgetOptions = <Widget>[

    //初始化过程中无法访问函数
    HomePage(), //首页

    OrderPage(),

    // TakeFood(setIndex: setIndex4,),
    // Center(child: Text('未开发此页面'),),Center(child: Text('未开发此页面'),)
    Center(child: Text('未开发此页面'),),

    UserPage(),
  ];


  final ExpansionTileController ETCcontroller =
      ExpansionTileController(); //折叠组件的controller

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    bool refresh = false;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.greenAccent,
          highlightColor: Color.fromRGBO(0, 0, 0, 0),
          splashColor: Color.fromRGBO(0, 0, 0, 0)),
      home: Scaffold(
        body: Center(
          child: refresh == true
              ? bottonViews(context, ETCcontroller).elementAt(_selectedIndex) //会刷新页面
              : IndexedStack(  //不会刷新页面
                  index: _selectedIndex,
                  children: <Widget>[

                    //初始化过程中无法访问函数
                    HomePage(), //首页

                    OrderPage(),

                    TakeFood(setIndex: setIndex4,),
                    // Center(child: Text('未开发此页面'),),Center(child: Text('未开发此页面'),)
                    Center(child: Text('未开发此页面'),),

                    UserPage(),
                  ],
                ),
        ),
        bottomNavigationBar: SizedBox(
          height: maxHeight <= 560 ? maxHeight * 0.15 : maxHeight * 0.08,
          child: GestureDetector(
            onLongPress: () => {},
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedLabelStyle: TextStyle(fontSize: 8),
              unselectedLabelStyle: TextStyle(fontSize: 8),
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              currentIndex: _selectedIndex,
              selectedFontSize: 0,
              // selectedItemColor: Colors.amber[800],
              onTap: (index){
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '首页',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.library_books),
                  label: '点餐',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.insert_drive_file),
                  label: '取餐',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet),
                  label: '卡券',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.accessibility_new),
                  label: '我的',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
