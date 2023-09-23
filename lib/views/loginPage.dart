import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:coffee/stateManage/stateManage.dart';
import '../screen/bottomNavigationBar.dart';
import 'userPage.dart';
import '../component/centerAppbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _phoneNumber = 0;
  int _smsCode = 0;

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AuthProvider>(context);
    return Material(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(maxHeight * 0.05), //Appbar高度
          child: CenterAppbar(
            titleName: '手机号登录',
            back: true,
          ),
        ),
        body: Container(
          height: maxHeight / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(_phoneNumber.toString()),
              // Text(_smsCode.toString()),
              Container(
                width: maxWidth * 0.9,
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, //限制只能输入数字
                    LengthLimitingTextInputFormatter(11), //限制只能输入11位数，以匹配手机号码
                  ],
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: '手机号码',
                  ),
                  onChanged: (value) {
                    // print(value.length);
                    setState(
                      () {
                        _phoneNumber = int.tryParse(value)!;
                      },
                    );
                  },
                ),
              ),
              Container(
                width: maxWidth * 0.9,
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, //限制只能输入数字
                    LengthLimitingTextInputFormatter(6), //限制只能输入11位数，以匹配手机号码
                  ],
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: '验证码',
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        _smsCode = int.tryParse(value)!;
                      },
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                // color: Colors.red,
                child: Row(
                  children: [
                    Container(
                      width: maxWidth * 0.5,
                      child: Center(
                        child: Container(
                          width: maxWidth * 0.3,
                          child: ElevatedButton(
                            onPressed: () => {getSMSCode(_phoneNumber)},
                            child: const Text('获取验证码',
                                style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: maxWidth * 0.5,
                      child: Center(
                        child: Container(
                          width: maxWidth * 0.3,
                          child: ElevatedButton(
                              onPressed: () => {
                                    signIn(
                                        _phoneNumber, _smsCode, authProvider),
                                Navigator.of(context).pushAndRemoveUntil(
                                  // 返回到指定的路由（Tabs为页面组件，需要在顶部引入，index为组件的参数)
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const bottomNavigationBar()),
                                    // 清空路由
                                        (route) => route == null)
                                  },
                              child: const Text('登录')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // ElevatedButton(onPressed: ()async=>{
              //   tok(authProvider)
              //
              // }, child: Text('登出'),)
            ],
          ),
        ),
      ),
    );
  }
}

tok(_authProvider) {
  _authProvider.logout();
  // print('应该刷新了');
}

class GetCode {
  String phoneNumberCountryCode = '86';
  String phoneNumber;
  String? smsCode;

  GetCode({required this.phoneNumber, this.smsCode}) {}

  Map<String, dynamic> toJson() {
    return {
      'CountryCode': phoneNumberCountryCode,
      'PhoneNumber': phoneNumber,
      'AuthCode': smsCode,
    };
  }
}

Future<dynamic> getSMSCode(_phoneNumber) async {
  GetCode gc = new GetCode(phoneNumber: _phoneNumber.toString());
  String gcStr = jsonEncode(gc.toJson());
  print(gcStr);
  var url = Uri.parse(
      'http://192.168.0.3:31000/RcApp/V1/Portal/AuthCodeForLoginByPhoneNumber');
  var headers = {
    'Content-Type': 'application/json',
  };

  // 发送POST请求
  var response = await http.post(
    url,
    headers: headers,
    body: gcStr,
  );

  // print(response.body);
}

Future<dynamic> signIn(_phoneNumber, _smsCode, _authProvider) async {
  bool onLine = false;
  if (onLine == false) {
    //下面是离线状态下的Token------------------------------
    // 这个是有订单数据的
    saveToken(
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJZCI6NywiQ29udGV4dElkIjoiNjFiYjg5NjMtY2I4MS00NmRmLWEyNjgtM2M4ZGU0MmYzNTFjIiwiRGV2aWNlIjoiIiwiT3BlcmF0b3JJZCI6NTB9.11hS2NI4xj32NS7e_uiHK4AUXrmGK1SwjZFbhmHLz6k");
    _authProvider.login();
    //这给是没有订单数据的
    // saveToken('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJZCI6NywiQ29udGV4dElkIjoiMzg5NzQ2NjctYjU3OS00YzdiLWE0OGQtNWI3NDNiZjQ1NTUyIiwiRGV2aWNlIjoiIiwiT3BlcmF0b3JJZCI6ODN9.ux_-fOF87O8QeMKyKUCFBvmVdrKxM8g5XBKG31zvbbI');
    // _authProvider.login();
    //-----------------------------------------------
  } else if (onLine == true) {
    // 创建POST请求的body对象
    GetCode sI = GetCode(
        phoneNumber: _phoneNumber.toString(), smsCode: _smsCode.toString());
    //把body对象序列化
    String sIStr = jsonEncode(sI.toJson());
    print(sIStr);
    //定义后端接口
    var url = Uri.parse(
        'http://192.168.0.3:31000/RcApp/V1/Portal/LoginByPhoneNumberWithAuthCode');
    //按照后端文档设置请求头
    var headers = {
      'Content-Type': 'application/json',
    };

    // 发送POST请求
    var response = await http.post(
      url,
      headers: headers,
      body: sIStr,
    );

    if (response.body != null) {
      Map<String, dynamic> token = jsonDecode(response.body);
      if (token['Data'] == '') {
        throw Exception('Data为空，请检查请求是否正确');
      } else {
        // print(token['Data']['Token']);
        //保存Token到磁盘
        saveToken(token['Data']['Token']);
        _authProvider.login();
        // String? userToken = await getToken();
        // print(userToken);
      }
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }
}

//保存Token
void saveToken(String token) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userToken', token);
  print('${token},保存token');
}

// 获取Token
Future<String?> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? userToken = prefs.getString('userToken');
  return userToken;
}
