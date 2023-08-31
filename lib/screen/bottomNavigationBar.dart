import 'package:flutter/material.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({super.key});

  @override
  State<bottomNavigationBar> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<bottomNavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> bottonViews(BuildContext context, ETCcontroller) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;

    List<Widget> widgetOptions = <Widget>[
      DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(maxHeight * 0.05), //Appbar高度
            child: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                '首页',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              actions: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Container(
                      width: maxWidth * 0.21,
                      height: maxHeight * 0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.15,
                        ),
                      ),

                      // color: Colors.red,
                      child: Row(
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: maxWidth * 0.1,
                            child: Icon(
                              Icons.more_horiz,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: maxHeight * 0.007,
                              bottom: maxHeight * 0.007,
                            ),
                            child: Container(
                              width: 0.3,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 0.15),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.transparent,
                            width: maxWidth * 0.1,
                            child: Icon(
                              Icons.access_time,
                              color: Colors.black,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            color: Colors.white,
            child: ListView(
              children: [
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(left: 8, top: 8, right: 4, bottom: 8),
                      width: maxWidth / 2,
                      height: maxWidth / 2.4,
                      child: Container(
                        color: Color.fromRGBO(158, 158, 158, 0.2),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: maxWidth / 22.4),
                              // color: Colors.green,
                              child: Icon(
                                Icons.lock,
                                size: 70,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 0),
                              // color: Colors.yellow,
                              child: Text(
                                '门店自取',
                                style: TextStyle(),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: 4,
                              ),
                              // color: Colors.purple,
                              child: Text(
                                'PICK UP',
                                style: TextStyle(fontSize: 8),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 8, top: 8, right: 4, bottom: 8),
                      width: maxWidth / 2,
                      height: maxWidth / 2.4,
                      child: Container(
                        color: Color.fromRGBO(158, 158, 158, 0.2),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: maxWidth / 22.4),
                              // color: Colors.green,
                              child: Icon(
                                Icons.priority_high,
                                size: 70,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 0),
                              // color: Colors.yellow,
                              child: Text(
                                '充值优惠',
                                style: TextStyle(),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: 4,
                              ),
                              // color: Colors.purple,
                              child: Text(
                                'DEPOSIT',
                                style: TextStyle(fontSize: 8),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ), //门店自取和充值优惠
                Container(
                  padding:
                      EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 8),
                  child: Container(
                    width: maxWidth,
                    height: maxHeight * 0.07,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(158, 158, 158, 0.2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color.fromRGBO(158, 158, 158, 0.2),
                        width: 0,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: maxWidth * 0.05),
                          // color: Colors.red,
                          child: Icon(
                            Icons.navigation,
                            size: 21,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: maxWidth * 0.25),
                          child: Text(
                            '江门新会第一店',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: maxWidth * 0.05),
                            // color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 4),
                                  // color:Colors.yellow,
                                  child: Icon(
                                    Icons.attachment,
                                    size: 20,
                                  ),
                                ),
                                Container(
                                  // padding: EdgeInsets.only(right: 4),
                                  height: maxHeight * 0.02,
                                  width: 0,

                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 0.25),
                                  ),
                                ),
                                Container(
                                  // color:Colors.yellow,
                                  padding: EdgeInsets.only(left: 4),
                                  // height: maxWidth * 0.07,
                                  child: Text(
                                    '切换',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ), //地图地址切换
                Container(
                  padding: EdgeInsets.all(8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(20)),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      "https://img2.baidu.com/it/u=2670376662,2835242121&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500",
                      width: double.maxFinite,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(20)),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      "https://img0.baidu.com/it/u=10872846,711081482&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800",
                      width: double.maxFinite,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Container(
                    width: maxWidth,
                    height: maxHeight * 0.06,
                    color: Color.fromRGBO(239, 199, 110,0.5),
                    child: Center(
                      child: Text(
                        '24H 有电就能做',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      const Text(
        'Index 1: Business',
        style: optionStyle,
      ),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
    ];
    return widgetOptions;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final ExpansionTileController ETCcontroller =
      ExpansionTileController(); //折叠组件的controller

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.greenAccent,
          highlightColor: Color.fromRGBO(0, 0, 0, 0),
          splashColor: Color.fromRGBO(0, 0, 0, 0)),
      home: Scaffold(
        body: Center(
          child: bottonViews(context, ETCcontroller).elementAt(_selectedIndex),
        ),
        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: GestureDetector(
            onLongPress: () => {},
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedLabelStyle: TextStyle(fontSize: 16),
              unselectedLabelStyle: TextStyle(fontSize: 16),
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              currentIndex: _selectedIndex,
              selectedFontSize: 0,
              // selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
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
