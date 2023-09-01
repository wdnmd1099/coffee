import 'package:flutter/material.dart';
import 'package:coffee/component/centerAppbar.dart';

class OrderPage extends StatefulWidget {
  OrderPage({
    Key? key,
    this.titleName,
  }) : super(key: key);
  String? titleName;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OrderPage> {
  List menu = [
    {
      '种类': '奶类',
      '内容': [
        {'名字': '热牛乳', '描述': '醇厚香浓|奶香浓郁', '售价': '6'},
        {'名字': '冷牛乳', '描述': '醇厚香浓|奶香浓郁', '售价': '99'}
      ]
    },
    {
      '种类': '咖啡',
      '内容': [
        {'名字': '美式', '描述': '中度烘焙，柑橘焦糖与草莓风味', '售价': '7'},
        {"名字": '拿铁', "描述": "0糖|醇厚香浓 350ml", '售价': '10'},
        {"名字": '生椰拿铁', "描述": '0乳糖|冷榨生椰', "售价": "12"}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(maxHeight * 0.05), //Appbar高度
        child: CenterAppbar(
          titleName: '点餐',
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: maxHeight * 0.8,
              color: Colors.green,
              width: maxWidth,
              child: ListView(
                children: [],
              ),
            ), //ListView的菜单界面
            Container(
              padding: EdgeInsets.only(
                left: maxWidth * 0.05,
                right: maxWidth * 0.05,
                top: maxWidth * 0.025,
                bottom: maxWidth * 0.025,
              ),
              height: maxHeight * 0.08,
              width: maxWidth,
              color: Color.fromRGBO(255, 165, 79, 1),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                      child: Container(
                        width: maxWidth * 0.9,
                        padding: EdgeInsets.only(left: maxWidth * 0.15),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(220, 120, 17, 1),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Stack(
                            children: [
                              Positioned(
                                child: Container(
                                  // alignment: Alignment.center,
                                  height: maxHeight,
                                  // color: Colors.red,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top:0,
                                          child: Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.circular(50),
                                              border: Border.all(
                                                color: Colors.transparent,
                                                width: 0,
                                              ),
                                            ),
                                            child:Center(
                                              child:  Text('0'),
                                            ),
                                          ),

                                      ),
                                      Positioned(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Row(
                                            children: [
                                              Text('￥'),
                                              Text('0'),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  // color: Colors.green,
                                  height: maxHeight,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      height: maxHeight,
                                      width: maxWidth * 0.2,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(51, 228, 228,0.6),
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(50),
                                          topRight: Radius.circular(50),
                                        ),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text('去结算',style: TextStyle(color: Colors.white,),),
                                      ),
                                    ),
                                  ),
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
            ), //去结算bar
          ],
        ),
      ),
    ); //点餐
  }
}
