import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:coffee/stateManage/stateManage.dart';




class MyUserPage extends StatefulWidget {
  const MyUserPage({super.key});

  @override
  State<MyUserPage> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<MyUserPage> {
  int _phoneNumber = 0;
  int _smsCode = 0;

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AuthProvider>(context);
    return Container(
      child: Column(
        children: [
          Text(_phoneNumber.toString()),
          Text(_smsCode.toString()),
          Container(
            width: maxWidth * 0.9,
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, //限制只能输入数字
                LengthLimitingTextInputFormatter(11), //限制只能输入11位数，以匹配手机号码
              ],
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
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
              decoration: InputDecoration(
                labelText: 'SMS verification code',
              ),
              onChanged: (value) {
                setState(
                  () {_smsCode = int.tryParse(value)!;
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
                  child:
                  Center(
                    child:
                      Container(
                        width: maxWidth * 0.3,
                        child:  ElevatedButton(
                            onPressed: () => {getSMSCode(_phoneNumber)},
                            child: Text('get code')),
                      ),

                  ),
                ),
               Container(
                 width: maxWidth * 0.5,
                 child:
                 Center(
                   child:
                     Container(
                       width: maxWidth * 0.3,
                       child:  ElevatedButton(
                           onPressed: () => {signIn(_phoneNumber, _smsCode, authProvider)},
                           child: Text('sign')),
                     ),

                 ),
               ),

              ],
            ),
          ),
          ElevatedButton(onPressed: ()async=>{
            tok(authProvider)

          }, child: Text('登出'),)
        ],
      ),
    );
  }
}

tok (_authProvider)  {
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
  //下面是离线状态下的Token------------------------------
  //这个是有订单数据的
  // saveToken("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJZCI6NywiQ29udGV4dElkIjoiNGEyZTY0ODMtZWE0MC00OTI3LTgyNTYtMTU0Mjk3ODE3NGZlIiwiRGV2aWNlIjoiIiwiT3BlcmF0b3JJZCI6NTB9.GoXGkYrROFE9EKlgfYdF1ooHgtCold5U6s2g3c7hspM");
  //这给是没有订单数据的
  saveToken('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJZCI6NywiQ29udGV4dElkIjoiMzg5NzQ2NjctYjU3OS00YzdiLWE0OGQtNWI3NDNiZjQ1NTUyIiwiRGV2aWNlIjoiIiwiT3BlcmF0b3JJZCI6ODN9.ux_-fOF87O8QeMKyKUCFBvmVdrKxM8g5XBKG31zvbbI');
  _authProvider.login();
  //-----------------------------------------------

  //// 创建POST请求的body对象
  // GetCode sI = GetCode(
  //     phoneNumber: _phoneNumber.toString(), smsCode: _smsCode.toString());
  // //把body对象序列化
  // String sIStr = jsonEncode(sI.toJson());
  // print(sIStr);
  // //定义后端接口
  // var url = Uri.parse(
  //     'http://192.168.0.3:31000/RcApp/V1/Portal/LoginByPhoneNumberWithAuthCode');
  // //按照后端文档设置请求头
  // var headers = {
  //   'Content-Type': 'application/json',
  // };
  //
  // // 发送POST请求
  // var response = await http.post(
  //   url,
  //   headers: headers,
  //   body: sIStr,
  // );
  //
  // if(response.body != null){
  //   Map<String, dynamic> token = jsonDecode(response.body);
  //   if(token['Data'] == ''){
  //     throw Exception('Data为空，请检查请求是否正确');
  //   }else{
  //     // print(token['Data']['Token']);
  //     //保存Token到磁盘
  //     saveToken(token['Data']['Token']);
  //     _authProvider.login();
  //     // String? userToken = await getToken();
  //     // print(userToken);
  //   }

  // }else{
  //   throw Exception('Request failed with status: ${response.statusCode}');
  // }

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
