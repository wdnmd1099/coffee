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
    List<Widget> widgetOptions = <Widget>[
      DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.05), //Appbar高度
            child: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              centerTitle: true,
              title: Text('首页',style: TextStyle(fontSize: 16,color: Colors.black),),
              actions: <Widget>[
                Center(
                  child:
                  Padding(
                    padding:EdgeInsets.only(right: 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.21,
                      height: MediaQuery.of(context).size.height * 0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.grey ,
                          width: 0.15,
                        ),
                      ),

                      // color: Colors.red,
                      child:Row(
                        children: [
                           Container(
                             color: Colors.transparent,
                             width:  MediaQuery.of(context).size.width * 0.1,
                             child:  Icon(Icons.more_horiz,color: Colors.black,),
                           ),
                          Container(
                            padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.007,
                            bottom: MediaQuery.of(context).size.height * 0.007,),

                            child: Container(
                              width: 0.3,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey,
                                    width: 0.15
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.transparent,
                            width:  MediaQuery.of(context).size.width * 0.1,
                            child:   Icon(Icons.access_time,color: Colors.black,size: 16,),
                          ),
                        ],
                      ),
                    ),
                  ),



                ),
              ],
            ),
          ),
          body: Container(),
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
