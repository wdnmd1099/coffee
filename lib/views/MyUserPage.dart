import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyUserPage extends StatefulWidget {
  const MyUserPage({super.key});

  @override
  State<MyUserPage> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<MyUserPage> {
  int _phoneNumber = 0;
  int _smsCode = 0;
  String showToken = '';

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Text(_phoneNumber.toString()),
          Text(_smsCode.toString()),
          Text(showToken),
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
                           onPressed: () =>
                           {signIn(_phoneNumber, _smsCode, showToken)},
                           child: Text('sign')),
                     ),

                 ),
               ),

              ],
            ),
          ),
        ],
      ),
    );
  }
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

Future<dynamic> signIn(_phoneNumber, _smsCode, showToken) async {
  GetCode sI = new GetCode(
      phoneNumber: _phoneNumber.toString(), smsCode: _smsCode.toString());
  String sIStr = jsonEncode(sI.toJson());
  print(sIStr);
  var url = Uri.parse(
      'http://192.168.0.3:31000/RcApp/V1/Portal/LoginByPhoneNumberWithAuthCode');
  var headers = {
    'Content-Type': 'application/json',
  };

  // 发送POST请求
  var response = await http.post(
    url,
    headers: headers,
    body: sIStr,
  );

  // print(response.body);

  Map<String, dynamic> token = jsonDecode(response.body);
  print(token['Data']['Token']);
  saveToken(token['Data']['Token']);
  String? userToken = await getToken();
  return userToken;
}

// 保存Token
Future<void> saveToken(String token) async {
  final storage = FlutterSecureStorage();
  await storage.write(key: 'userToken', value: token);
}

// 获取Token
Future<String?> getToken() async {
  final storage = FlutterSecureStorage();
  await storage.read(key: 'userToken');
  return await storage.read(key: 'userToken');
}
