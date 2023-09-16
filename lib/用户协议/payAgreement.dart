import 'package:flutter/material.dart';

class PayAgreement extends StatefulWidget {
  const PayAgreement({super.key});

  @override
  State<PayAgreement> createState() => _PayAgreementState();
}

class _PayAgreementState extends State<PayAgreement> {
  final String userAgreement = '''
  特别提示：您在同意协议前应完整、仔细地阅读本协议，您勾选同意并继续支付将被视为完成理解并接受以下全部协议条款。您在T1咖啡小程序（下称“小程序”）上勾选同意支付协议后，即成为本支付协议之授权人，该授权即刻发生效力。
您如果不同意以下协议条款，请勿勾选同意，且不要进行后续操作。

支付协议

一、	授权人兹授权T1咖啡（中国）有限公司（以下简称“乙方”）通过第三方支付平台划扣服务费。
二、	服务费是指授权人通过小程序提交的订单上记载的总费用。
三、	在授权人成功过提交订单后，乙方依照小程序上公布的收费规则计算服务费用。授权人应在5分钟内页面指示完成支付。
四、	如因授权人在第三方支付平台中的支付账户被锁定、盗用、被往来银行拒绝或账户无效等，以致支付账户付款失败时，乙方有权依据与授权人之消费账单要求授权人支付服务费。
五、	授权人如有冒用、盗用他人支付账户之行为，须自负法律责任。
六、	在使用小程序服务的过程中，包括但不限注册、点单、支付、收货等，如授权人未遵从相关规则，则乙方有权拒绝为授权人提供相关服务，且无需承担任何责任。因授权人的过错导致的任何损失由授权人承担，该等过错包括但不限于：不按照交易提示操作，未及时进行交易操作等。
七、	授权人同意其消费产生的服务费用以乙方记录的数据未准，乙方通过小程序告知授权人。授权人对服务费用有异议或发现扣款金额与应缴费用金额不符时，可及时与小程序客服联系，客服热线：4000-100-100

本版本发布时间：2023年7月13日

  ''';

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('支付协议',style: TextStyle(fontSize: 16),),
      ),
      body: Container(

        child: ListView(
          children: [

            Container(
              child: Text(
                userAgreement,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
