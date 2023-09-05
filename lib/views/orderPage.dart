import 'package:coffee/component/checkoutBar.dart';
import 'package:flutter/material.dart';
import 'package:coffee/component/centerAppbar.dart';
import 'package:coffee/component/menuCardList.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
    var c1 = xxx();
    // print(c1);

    return FutureBuilder<List>(
      future: xxx(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // 请求还在进行中
          // print('进行中');
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // 请求发生错误
          return Text('发生错误: ${snapshot.error}');
        } else {
          // 请求成功完成
          List v1 = [];
          if (snapshot.data!.length > 0) {
            // print(snapshot.data?.length);
            v1 = snapshot.data!;
          }
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
                      child: MenuCardList(
                        meun: v1,
                      ),
                    ),
                  ),
                  //ListView的菜单界面
                  const CheckoutBar(), //去结算bar
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class Shop {
  String shopD;

  Shop({required this.shopD}) {
    // print('是' + this.shopCode);
    shopD = this.shopD;
  }

  // factory Shop.fromJson(Map<String, dynamic> json) {
  //   print('工厂了');
  //   return Shop(
  //     shopD: json['shopD'],
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      'ShopCode': shopD,
    };
  }
}

Future<List> xxx() async {
  //创建对象
  Shop shop = Shop(shopD: 'S001');
  // print(shop);
  // 将Map对象转换为JSON字符串
  String jsonString1 = jsonEncode(shop.toJson());
  // print(jsonString1);
  // 定义请求的URL
  var url = Uri.parse('http://192.168.0.3:31000/RcApp/V1/Shop/GetMenuTree');

  // 定义请求头部参数
  var headers = {
    'Content-Type': 'application/json',
  };

  // 发送POST请求
  var response = await http.post(
    url,
    headers: headers,
    body: jsonString1,
  );

  // 输出响应结果
  // print(response.body);

  //把获得的结果反序列化成Map对象
  Map<String, dynamic> jsonMap = json.decode(response.body);
  //从Map对象数据获取其中的Data数据，Data的类型是List，里面装的是菜单的具体数据，具体数据结构看临时文件=>菜单数据.dart
  List menuList = jsonMap['Data'];

  return menuList;
}

