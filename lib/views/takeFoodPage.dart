import 'dart:convert';
import 'package:coffee/screen/bottomNavigationBar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:coffee/component/takeFoodCardList.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../component/centerAppbar.dart';
import 'package:coffee/stateManage/stateManage.dart';
part 'takeFoodPage.g.dart';

class TakeFood extends StatefulWidget {
  TakeFood({super.key,required this.setIndex});
  Function setIndex;

  @override
  State<TakeFood> createState() => _TakeFoodState();
}

class _TakeFoodState extends State<TakeFood> {



  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AuthProvider>(context);
    final indexProvider = Provider.of<BottomNavigationBarIndex>(context);

    return authProvider.isLoggedIn
        ? FutureBuilder<List<dynamic>>(
            future: takeFoodPageToGetData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // 请求还在进行中
                // print('进行中');
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // 请求发生错误
                print(snapshot.error);
                return Center(child: Text(' ${snapshot.error}'));
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
                  return const Center(
                    child: Text('订单数据为空，如果你非新用户，请联系管理员'),
                  );
                }
              }
            },
          )
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(maxHeight * 0.05), //Appbar高度
              child: CenterAppbar(
                titleName: '取餐',
              ),
            ),
              body: Container(
                height: maxHeight,
                width: maxWidth,
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding:  //内边距
                    MaterialStateProperty.all(EdgeInsets.all(0)),
                    shadowColor:  //阴影
                    MaterialStateProperty.all(Colors.transparent),
                    backgroundColor: // 背景色
                    MaterialStateProperty.all(Colors.green),
                  ),
                  onPressed: ()=>{
                    //只能重新加载一次，用状态管理导航index一定会刷新，刷新就会重新请求数据，不刷新就无法跳转页面，暂时找不到办法解决。
                    widget.setIndex()
                  },
                  child: Text('去登录'),
                ),
              ),
          );
  }
}

class TakeFoodObj {
  String? Id; //订单编号
  String? ShopCode; //店铺编码
  int? Page; //分页码
  int? PageSize; //分页大小

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

  String? token = await getToken(); //获取Token
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

    String jsonString = response.body;
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    if (jsonMap['Data']['Count'] == 0) {
      throw '订单数为零，请检查是否是新用户或发的请求有误';
    } else {
      HaveData haveData = HaveData.fromJson(jsonMap);
      // print(jsonMap['Data']['Data'] is List);
      var lll = jsonEncode(haveData.Data);

      IsData isData = IsData.fromJson(json.decode(lll));
      // print(isData.Count);
      // return IsData.Data 或者 jsonMap['Data']['Data'] 都可以，它们是一样的，不同的是前者是通过对象new出来的，后者是直接解析出来的
      return isData.Data;
    }
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

@JsonSerializable()
class HaveData {
  int Type;
  int Code;
  String Desc;
  Map<String, dynamic> Data;

  HaveData(
      {required this.Type,
      required this.Code,
      required this.Desc,
      required this.Data});

  factory HaveData.fromJson(Map<String, dynamic> json) =>
      _$HaveDataFromJson(json);

  Map<String, dynamic> toJson() => _$HaveDataToJson(this);
}

@JsonSerializable()
class IsData {
  int Count;
  List Data;

  IsData({
    required this.Count,
    required this.Data,
  });

  factory IsData.fromJson(Map<String, dynamic> json) => _$IsDataFromJson(json);

  Map<String, dynamic> toJson() => _$IsDataToJson(this);
}
