import 'package:coffee/views/myUserPage.dart';
import 'package:flutter/material.dart';

import '../component/centerAppbar.dart';
import 'loginPage.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(maxHeight * 0.05), //Appbar高度
          child: CenterAppbar(
            titleName: '用户中心',
          ),
        ),
        body: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              Container(
                height: maxHeight * 0.3,
                // color: Colors.red,
                child: Image.network(
                  'https://img2.baidu.com/it/u=1359644096,791156802&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
                  height: maxHeight * 0.3,
                  width: maxWidth,
                  fit: BoxFit.cover,
                ),
              ), //背景图片
              Container(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                color: Colors.white,
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      padding: //内边距
                          MaterialStateProperty.all(EdgeInsets.only(
                              top: 14, bottom: 14, left: 24, right: 24)),
                      shadowColor: //阴影
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 150),
                          pageBuilder: (_, __, ___) => LoginPage(),
                          transitionsBuilder: (_, animation, __, child) {
                            return SlideTransition(
                              position: Tween(
                                begin: Offset(0.0, 1.0),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            );
                          },
                        ),
                      ),
                    },
                    child: Text(
                      '登录/注册',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ), //登录注册按钮
              Container(
                height: maxHeight * 0.15,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      height: 4,
                      width: maxWidth,
                      color: Colors.grey[400],
                    ), //分割线
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Container(
                              width: maxWidth / 2,
                              // color: Colors.red,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add),
                                  Text('余额(元)'),
                                  Text('0'),
                                ],
                              ),
                            ),
                            Container(
                              width: maxWidth / 2,
                              // color: Colors.red,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add),
                                  Text('卡券'),
                                  Text('0'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 4,
                      width: maxWidth,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ), // 余额卡券显示
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      onTap: () => {backPrint('充值记录')},
                      leading: Icon(Icons.add),
                      title: Text('充值记录'),
                      trailing: Text(
                        '>',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    ListTile(
                      onTap: () => {backPrint('联系我们')},
                      leading: Icon(Icons.add),
                      title: Text('联系我们'),
                      trailing: Text(
                        '>',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    ListTile(
                      onTap: () => {backPrint('反馈中心')},
                      leading: Icon(Icons.add),
                      title: Text('反馈中心'),
                      trailing: Text(
                        '>',
                        style: TextStyle(fontSize: 24),
                      ),
                    )
                  ],
                ),
              ), //充值记录，联系我们，反馈中心
            ],
          ),
        ));
  }
}

void backPrint(String text) {
  print(text);
}
