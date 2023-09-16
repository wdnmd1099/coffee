import 'package:flutter/material.dart';

class CenterAppbar extends StatefulWidget {
  CenterAppbar({Key? key, required this.titleName, this.back})
      : super(key: key);
  String titleName;
  bool? back = false;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CenterAppbar> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return AppBar(
      titleSpacing: 0,
      //标题间的间距
      elevation: 0,
      //阴影
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      automaticallyImplyLeading: false,
      //不要自动设置leading
      title: widget.back != null && widget.back!
          ? Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => {
                      Navigator.pop(context) //返回上一页
                    },
                    child: Container(
                      // color: Colors.red,
                      width: 44,
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                        size: 32,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.titleName,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.only(left: 8),
              // color: Colors.black,
              child: Text(
                widget.titleName,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
    );
  }
}
