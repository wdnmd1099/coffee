import 'dart:convert';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:coffee/component/takeFoodCardList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../component/centerAppbar.dart';

class TakeFood extends StatefulWidget {
  const TakeFood({super.key});

  @override
  State<TakeFood> createState() =>
      _TakeFoodState();
}

class _TakeFoodState extends State<TakeFood> {
  // List data = [
  //   {'店名':'龙头店','图片地址':'https://img0.baidu.com/it/u=3543035106,2121797620&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1693933200&t=5895b615bc65e4a1db430762726629aa',
  //     '饮品名字':'拿铁','订单状态':"已创建",'价钱':'22','时间':'2023-07-21 06:49:50','付款状态':'去付款'},
  //   {'店名':'街角店','图片地址':'https://img0.baidu.com/it/u=3543035106,2121797620&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1693933200&t=5895b615bc65e4a1db430762726629aa',
  //     '饮品名字':'拿铁','订单状态':"已支付",'价钱':'22','时间':'2023-07-21 06:49:50','付款状态':'显示取餐码'},
  //   {'店名':'龙头店','图片地址':'https://img0.baidu.com/it/u=3543035106,2121797620&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1693933200&t=5895b615bc65e4a1db430762726629aa',
  //     '饮品名字':'拿铁','订单状态':"已支付",'价钱':'22','时间':'2023-07-21 06:49:50','付款状态':'显示取餐码'},
  //   {'店名':'龙头店','图片地址':'https://img0.baidu.com/it/u=3543035106,2121797620&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1693933200&t=5895b615bc65e4a1db430762726629aa',
  //     '饮品名字':'拿铁','订单状态':"已支付",'价钱':'22','时间':'2023-07-21 06:49:50','付款状态':'显示取餐码'},
  //   {'店名':'龙头店','图片地址':'https://img0.baidu.com/it/u=3543035106,2121797620&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1693933200&t=5895b615bc65e4a1db430762726629aa',
  //     '饮品名字':'拿铁','订单状态':"已支付",'价钱':'22','时间':'2023-07-21 06:49:50','付款状态':'显示取餐码'},
  //   {'店名':'龙头店','图片地址':'https://img0.baidu.com/it/u=3543035106,2121797620&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1693933200&t=5895b615bc65e4a1db430762726629aa',
  //     '饮品名字':'拿铁','订单状态':"已支付",'价钱':'22','时间':'2023-07-21 06:49:50','付款状态':'显示取餐码'},
  //   {'店名':'龙头店','图片地址':'https://img0.baidu.com/it/u=3543035106,2121797620&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1693933200&t=5895b615bc65e4a1db430762726629aa',
  //     '饮品名字':'拿铁','订单状态':"已支付",'价钱':'22','时间':'2023-07-21 06:49:50','付款状态':'显示取餐码'},
  //   {'店名':'龙头店','图片地址':'https://img0.baidu.com/it/u=3543035106,2121797620&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1693933200&t=5895b615bc65e4a1db430762726629aa',
  //     '饮品名字':'拿铁','订单状态':"已支付",'价钱':'22','时间':'2023-07-21 06:49:50','付款状态':'显示取餐码'},
  //   {'店名':'龙头店','图片地址':'https://img0.baidu.com/it/u=3543035106,2121797620&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1693933200&t=5895b615bc65e4a1db430762726629aa',
  //     '饮品名字':'拿铁','订单状态':"已支付",'价钱':'22','时间':'2023-07-21 06:49:50','付款状态':'显示取餐码'},
  //
  //   // {'店名':'','图片地址':'','订单状态':"已创建",'价钱':'','时间':'','付款状态':''}
  // ] ;
  @override
  Widget build(BuildContext context) {
    List data =  TakeFoodPageToGetData();
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(maxHeight * 0.05), //Appbar高度
        child: CenterAppbar(
          titleName: '取餐',
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 12),
        // height: maxHeight,
        // width: maxWidth,
        color: Colors.grey[200],
        child: TakeFoodCard(takeFoodData: data,),
      ),
    );
  }
}








class TakeFoodObj {
    String? Id;
    String? ShopCode;      //店铺编码
    double? Page;      //分页码
    double? PageSize;      //分页大小


    TakeFoodObj({ this.Id,this.ShopCode,this.Page,this.PageSize}){}

    Map<String,dynamic> toJson(){
      return {
        'Id':Id,
        'ShopCode':ShopCode,
        'Page':Page,
        'PageSize':PageSize,
      };
    }
}

TakeFoodPageToGetData() async {
  String? token = await getToken();
  // print('取餐');
  // String? token = await getToken();

  TakeFoodObj take = new TakeFoodObj(ShopCode: 's001',Page: 1,PageSize: 20,);
  String jsonString1 = jsonEncode(take.toJson());
  var url = Uri.parse('http://192.168.0.3:31000/RcApp/V1/Order/Select');
  var headers;
  if(token != null){
    headers = {
      'Content-Type': 'application/json',
      'X-API-TOKEN':token,
    };
  }else{
    print('token null 了');
  }

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
  List orderData = jsonMap['Data']['Data'];
  print(orderData);

  return orderData;
}


//读token
Future<String?> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? userToken = prefs.getString('userToken');
  return userToken;
}









