import 'package:coffee/component/checkoutBar.dart';
import 'package:flutter/material.dart';
import 'package:coffee/component/centerAppbar.dart';
import 'package:coffee/component/menuCardList.dart';
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
      'inside': [
        {'名字': '热牛乳1111111111111111111111', '描述': '醇厚香浓|奶香浓郁', '售价': '6'},
        {'名字': '冷牛乳', '描述': '醇厚香浓|奶香浓郁', '售价': '99'},
        {'名字': '柠檬茶', '描述': '醇厚香浓|奶香浓郁', '售价': '22'},
        {'名字': '绿茶', '描述': '醇厚香浓|奶香浓郁', '售价': '9.9'},
        {'名字': '红茶', '描述': '醇厚香浓|奶香浓郁', '售价': '18'},
      ]
    },
    {
      '种类': '咖啡',
      'inside': [
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
            Expanded(
              child: Container(
                color: Colors.grey[200],
                width: maxWidth,
                child: MenuCardList(meun: menu,),
              ),
            ),
            //ListView的菜单界面
            const CheckoutBar(), //去结算bar
          ],
        ),
      ),
    ); //点餐
  }
}
