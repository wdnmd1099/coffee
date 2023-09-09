import 'package:flutter/material.dart';


//此组件是一个遮罩层对话框组件，需要传入点击后触发显示对话框的按钮样式，和显示的对话框样式
class DialogWidget extends StatefulWidget {
  Widget wrapper;  //用于点击的button样式
  Widget dialogWidget ;  //点击后出现的对话框样式
  DialogWidget({super.key, required this.dialogWidget,required this.wrapper}){}

  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  bool _visible = false;


  @override
  void initState() {
    super.initState();
    // 延迟一段时间后显示对话框的淡入效果
    setState(() {
      _visible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.wrapper,
      onTap: () {
        showDialog(
          context: context,
          builder:
              (BuildContext context) {
            return AnimatedOpacity(
              opacity:
              _visible ? 1.0 : 0.0,
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
      },
    );
  }
}
