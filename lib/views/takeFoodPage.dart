import 'dart:convert';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:coffee/component/takeFoodCardList.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../component/centerAppbar.dart';
import '../main.dart';

class TakeFood extends StatefulWidget {
  const TakeFood({super.key});

  @override
  State<TakeFood> createState() => _TakeFoodState();
}

class _TakeFoodState extends State<TakeFood> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AuthProvider>(context);
    // print(getToken());
    return authProvider.isLoggedIn
        ? FutureBuilder<List<dynamic>>(
            future: takeFoodPageToGetData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // 请求还在进行中
                print('进行中');
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // 请求发生错误
                return Text('发生错误: ${snapshot.error}');
              } else {
                // 请求成功完成
                List orderData = [];
                if (snapshot.data!.length > 0) {
                  orderData = snapshot.data!;
                  return Scaffold(
                    appBar: PreferredSize(
                      preferredSize:
                          Size.fromHeight(maxHeight * 0.05), //Appbar高度
                      child: CenterAppbar(
                        titleName: '取餐',
                      ),
                    ),
                    body: Container(
                      padding: EdgeInsets.only(top: 12),
                      // height: maxHeight,
                      // width: maxWidth,
                      color: Colors.grey[200],
                      child: TakeFoodCard(
                        takeFoodData: orderData,
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Text('订单数据为空，如果你非新用户，请联系管理员'),
                  );
                }
              }
            },
          )
        : Center(
            child: Text('请先登录'),
          );
  }
}

class TakeFoodObj {
  String? Id;   //订单编号
  String? ShopCode; //店铺编码
  double? Page; //分页码
  double? PageSize; //分页大小

  TakeFoodObj({this.Id, this.ShopCode, this.Page, this.PageSize}) {}

  Map<String, dynamic> toJson() {
    return {
      'Id': Id,
      'ShopCode': ShopCode,
      'Page': Page,
      'PageSize': PageSize,
    };
  }
}

Future<List> takeFoodPageToGetData() async {
  print('这是取餐页的方法被调用了');
  TakeFoodObj take = TakeFoodObj(
    ShopCode: 's001',
    Page: 1,
    PageSize: 20,
  );
  String jsonString1 = jsonEncode(take.toJson());
  var url = Uri.parse('http://192.168.0.3:31000/RcApp/V1/Order/Select');
  var headers;

  String? token = await getToken();
  if (token != null) {
    headers = {
      'Content-Type': 'application/json',
      'X-API-TOKEN': token,
    };
    var response = await http.post(
      url,
      headers: headers,
      body: jsonString1,
    );
    //序列化获得的订单，有订单数count，但目前测试数量不多，如有多页逻辑再写
    Map<String, dynamic> jsonMap = json.decode(response.body);
    //有数量和订单 {数量：XXX，订单：【xxxxxxx】}
    // Map orderData = jsonMap['Data'];
    //订单列表
    List<dynamic> orderData = jsonMap['Data']['Data'];
    // print(orderData);

    return orderData;
  } else {
    print('token null 了');
    return [];
  }
}

//读token
Future<String?> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? userToken = prefs.getString('userToken');
  return userToken;
}
