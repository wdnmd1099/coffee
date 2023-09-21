import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';

import '../stateManage/stateManage.dart';


//此组件是一个遮罩层对话框组件，需要传入点击后触发显示对话框的按钮样式，和显示的对话框样式
class MaskDialog extends StatefulWidget {
  MaskDialog({super.key, required this.dialogWidget,required this.wrapper,this.setIndex});
  Widget wrapper;  //用于点击的button样式
  Widget dialogWidget ;  //点击后出现的对话框样式
  Function? setIndex;


  @override
  _MaskDialogState createState() => _MaskDialogState();
}

class _MaskDialogState extends State<MaskDialog> {
  // bool _visible = false;
  //
  //
  // @override
  // void initState() {
  //   super.initState();
  //   // 延迟一段时间后显示对话框的淡入效果
  //   setState(() {
  //     _visible = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final maskDiaLog = Provider.of<MaskDiaLog>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return GestureDetector(
      child: widget.wrapper,
      onTap: () {
        if(authProvider.isLoggedIn == false){
          // print(widget.setIndex);
          widget.setIndex != null ? widget.setIndex!() : null ;
          showToast('请先登录',
              duration:Duration(milliseconds: 2000),
              textStyle:TextStyle(fontSize: 12,color: Colors.white),
              context: context,
              animation: StyledToastAnimation.fade,
              curve: Curves.linear,
              reverseCurve: Curves.linear);
        }else if(authProvider.isLoggedIn == true){
          maskDiaLog.open();
          showDialog(
            // barrierDismissible:false,
            context: context,
            builder:
                (BuildContext context) {
              return AnimatedOpacity(
                opacity:
                maskDiaLog.isOpen ? 1.0 : 0.0,
                duration:
                const Duration(),
                child: Dialog(
                  child: Container(
                    padding:
                    const EdgeInsets.all(0.0),
                    child: widget.dialogWidget,
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
