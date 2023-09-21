import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../component/centerAppbar.dart';
import '../views/chooseLoginPage.dart';
import '../views/userPage.dart';
import '../用户协议/payAgreement.dart';
import '../用户协议/privacyAgreement.dart';
import '../用户协议/userAgreement.dart';



checkAgree(bool agree_) {
  if (agree_ == false) {
  } else if (agree_ == true) {
    print('已同意');
  }
}


Widget originalLoginPage(context,agree){
  double maxHeight = MediaQuery.of(context).size.height;
  double maxWidth = MediaQuery.of(context).size.width;
  String awaitYesIcon = '<svg t="1694830795237" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="10258" width="32" height="32"><path d="M196.923077 78.769231a118.153846 118.153846 0 0 0-118.153846 118.153846v630.153846a118.153846 118.153846 0 0 0 118.153846 118.153846h630.153846a118.153846 118.153846 0 0 0 118.153846-118.153846V196.923077a118.153846 118.153846 0 0 0-118.153846-118.153846H196.923077z m0-78.769231h630.153846a196.923077 196.923077 0 0 1 196.923077 196.923077v630.153846a196.923077 196.923077 0 0 1-196.923077 196.923077H196.923077a196.923077 196.923077 0 0 1-196.923077-196.923077V196.923077a196.923077 196.923077 0 0 1 196.923077-196.923077z" p-id="10259" fill="#cdcdcd"></path></svg>';
  String yesIcon = '<svg t="1694830760846" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="10025" width="32" height="32"><path d="M196.923077 0h630.153846a196.923077 196.923077 0 0 1 196.923077 196.923077v630.153846a196.923077 196.923077 0 0 1-196.923077 196.923077H196.923077a196.923077 196.923077 0 0 1-196.923077-196.923077V196.923077a196.923077 196.923077 0 0 1 196.923077-196.923077z m0 78.769231a118.153846 118.153846 0 0 0-118.153846 118.153846v630.153846a118.153846 118.153846 0 0 0 118.153846 118.153846h630.153846a118.153846 118.153846 0 0 0 118.153846-118.153846V196.923077a118.153846 118.153846 0 0 0-118.153846-118.153846H196.923077z m584.900923 258.205538a36.509538 36.509538 0 0 1 1.260308 51.633231l-299.480616 313.107692c-0.118154 0.157538-0.393846 0.236308-0.630154 0.472616l-0.393846 0.551384c-2.166154 2.126769-4.726154 3.229538-7.207384 4.726154-1.575385 0.866462-2.796308 2.166154-4.411077 2.835692a35.800615 35.800615 0 0 1-27.490462 0.07877c-1.260308-0.512-2.284308-1.614769-3.544615-2.284308-2.756923-1.457231-5.592615-2.835692-8.034462-5.12-0.196923-0.157538-0.275692-0.433231-0.512-0.669538-0.196923-0.118154-0.393846-0.196923-0.551384-0.354462l-150.843077-156.593231a36.430769 36.430769 0 0 1 0.945231-51.633231 36.391385 36.391385 0 0 1 51.63323 0.945231l124.455385 129.102769 273.092923-285.61723a36.548923 36.548923 0 0 1 51.712-1.181539z" p-id="10026" fill="#cdcdcd"></path></svg>';


  return Material(
    child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(maxHeight * 0.05), //Appbar高度
        child: CenterAppbar(
          titleName: '账户登录',
          back: true,
        ),
      ),
      body: Container(
        color: Colors.white,
        height: maxHeight,
        width: maxWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: ()=>{
                checkAgree(agree)
              },
              child:  Container(
                alignment: Alignment.center,
                width: maxWidth * 0.8,
                height: 30,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 51, 102, 1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Text('手机号安全登录',style: TextStyle(fontSize: 12,color: Colors.white),),
              ),  //手机号安全登录,
            ),
            const Padding(padding: EdgeInsets.only(top: 20),),
            GestureDetector(
              onTap: ()=>{
                checkAgree(agree)
              },
              child:  Container(
                alignment: Alignment.center,
                width: maxWidth * 0.8,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Text('一键登录',style: TextStyle(fontSize: 12,color: Colors.white),),
              ),  //一键登录,
            ),
            const Padding(padding: EdgeInsets.only(top: 20),),
            Container(
              width: maxWidth * 0.9,
              height: 30,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: ()=>{
                      // setState((){
                      //   agree = !agree;
                      // })
                    },
                    child: agree?SvgPicture.string(
                      yesIcon, // 替换为您自己的 SVG 图像路径
                      width: 24.0, // 设置 SVG 图像的宽度
                      height: 24.0, // 设置 SVG 图像的高度
                    ):SvgPicture.string(
                      awaitYesIcon, // 替换为您自己的 SVG 图像路径
                      width: 24.0, // 设置 SVG 图像的宽度
                      height: 24.0, // 设置 SVG 图像的高度
                    ),
                  ),
                  const Text(' 已阅读并同意 ',style: TextStyle(fontSize: 12),),
                  GestureDetector(
                    onTap: ()=>{
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserAgreement()),
                      ),
                    },
                    child: const Text('《用户协议》',style: TextStyle(fontSize: 12,color: Colors.blue),),
                  ),//用户协议
                  GestureDetector(
                    onTap: ()=>{
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PrivacyAgreement()),
                      ),
                    },
                    child: const Text('《隐私协议》',style: TextStyle(fontSize: 12,color: Colors.blue),),
                  ),//用户协议
                  GestureDetector(
                    onTap: ()=>{
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PayAgreement()),
                      ),
                    },
                    child: const Text('《支付协议》',style: TextStyle(fontSize: 12,color: Colors.blue),),
                  ),//用户协议
                ],
              ),
            ),//阅读同意
          ],
        ),
      ),
    ),
  );
}