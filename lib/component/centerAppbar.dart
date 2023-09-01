import 'package:flutter/material.dart';

class CenterAppbar extends StatefulWidget {
  CenterAppbar({Key? key, this.titleName,}) : super(key: key);
  String? titleName;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CenterAppbar> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        widget.titleName!,
        style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold,),
      ),
      actions: <Widget>[
        Center(
          child: Padding(
            padding: EdgeInsets.only(right: 8),
            child: Container(
              width: maxWidth * 0.21,
              height: maxHeight * 0.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.grey,
                  width: 0.15,
                ),
              ),

              // color: Colors.red,
              child: Row(
                children: [
                  Container(
                    color: Colors.transparent,
                    width: maxWidth * 0.1,
                    child: Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: maxHeight * 0.007,
                      bottom: maxHeight * 0.007,
                    ),
                    child: Container(
                      width: 0.3,
                      decoration: BoxDecoration(
                        border:
                        Border.all(color: Colors.grey, width: 0.15),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    width: maxWidth * 0.1,
                    child: Icon(
                      Icons.access_time,
                      color: Colors.black,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
