import 'package:coffee/%E7%94%A8%E6%88%B7%E5%8D%8F%E8%AE%AE/payAgreement.dart';
import 'package:coffee/%E7%94%A8%E6%88%B7%E5%8D%8F%E8%AE%AE/userAgreement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/svg.dart';
import '../component/centerAppbar.dart';
import '../用户协议/privacyAgreement.dart';
import 'loginPage.dart';

class ForJumpPage extends StatefulWidget {
  ForJumpPage({super.key, required this.title,required this.inside,this.titleCenter});
  Widget inside;
  String title;
  bool? titleCenter = true;

  @override
  State<ForJumpPage> createState() => _ForJumpPageState();
}

class _ForJumpPageState extends State<ForJumpPage> {
  @override
  Widget build(BuildContext context) {
    //原版登录界面样式在临时文件
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;

    String awaitYesIcon =
        '<svg t="1694852345246" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="27860" width="32" height="32"><path d="M511.7952 256c141.2096 0 256 114.7904 256 256s-114.7904 256-256 256-256-114.7904-256-256S370.688 256 511.7952 256M511.7952 204.8c-169.6768 0-307.2 137.5232-307.2 307.2 0 169.6768 137.5232 307.2 307.2 307.2s307.2-137.5232 307.2-307.2C818.9952 342.3232 681.472 204.8 511.7952 204.8L511.7952 204.8z" fill="#bfbfbf" p-id="27861"></path></svg>';
    String yesIcon =
        '<svg t="1694852431290" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="32252" width="32" height="32"><path d="M514.56 256c141.2096 0 256 114.7904 256 256s-114.7904 256-256 256-256-114.7904-256-256S373.3504 256 514.56 256M514.56 204.8c-169.6768 0-307.2 137.5232-307.2 307.2 0 169.6768 137.5232 307.2 307.2 307.2s307.2-137.5232 307.2-307.2C821.76 342.3232 684.2368 204.8 514.56 204.8L514.56 204.8z" fill="#2c2c2c" p-id="32253"></path><path d="M707.1744 384c-8.8064-7.9872-22.4256-7.3728-30.4128 1.4336L486.912 594.1248l-136.3968-117.76c-9.0112-7.7824-22.6304-6.7584-30.4128 2.2528-7.7824 9.0112-6.7584 22.6304 2.2528 30.4128l152.3712 131.4816c1.2288 1.1264 2.7648 1.7408 4.1984 2.4576 0.8192 0.4096 1.536 1.024 2.3552 1.3312 2.4576 0.9216 5.0176 1.3312 7.4752 1.3312 2.9696 0 5.9392-0.6144 8.704-1.8432 0.9216-0.4096 1.6384-1.2288 2.4576-1.8432 1.6384-1.024 3.3792-1.9456 4.7104-3.3792L708.608 414.5152C716.5952 405.7088 715.9808 392.0896 707.1744 384" fill="#2c2c2c" p-id="32254"></path></svg>';
    return Material(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(maxHeight * 0.05), //Appbar高度
          child: CenterAppbar(
            titleName: widget.title,
            back: true,
            center: widget.titleCenter,
          ),
        ), //头部
        body: widget.inside,
      ),
    );
  }
}
