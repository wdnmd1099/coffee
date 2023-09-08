import 'dart:convert';

import 'package:flutter/material.dart';
import 'maskDialog.dart';


class MenuCardList extends StatefulWidget {
  const MenuCardList({super.key, required this.meun});

  final List meun;

  @override
  State<MenuCardList> createState() => _MenuCardListState();
}

class _MenuCardListState extends State<MenuCardList> {
  bool _visible = false;

  void initState() {
    super.initState();
    // 延迟一段时间后显示对话框的淡入效果
    setState(() {
      _visible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: widget.meun.length,
      itemBuilder: (BuildContext context, int index) {
        var item = widget.meun[index];
        var children = item['Children'];
        return Column(
          children: [
            // Text('种类: ${item['种类']}'),
            SizedBox(
              height: maxHeight * 0.06,
              width: maxWidth,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: Icon(
                          Icons.add_card,
                          size: 21,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        item['Name'],
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    height: 0.25,
                    child: Container(
                      decoration: BoxDecoration(
                          // color: Colors.purple,
                          border: Border.all(color: Colors.grey, width: 0.25)),
                    ),
                  ),
                ],
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: children.length,
              itemBuilder: (BuildContext context, int childrenIndex) {
                var childrenItem = children[childrenIndex];
                var ImagesPath = jsonDecode(childrenItem['Images']);
                // print(ImagesPath[0] is String);
                return Container(
                  padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Container(
                    height: 100,
                    width: maxWidth,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 242, 204, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:
                    Row(
                      children: [
                        SizedBox(
                          height: maxHeight,
                          width: maxWidth * 0.3,
                          child: Container(
                            height: 100,
                            decoration: const BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                              ),
                              child: Image.network(
                                // 'https://img2.baidu.com/it/u=2396175778,1836017861&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666',
                                'http://192.168.0.3:9000/rc-resource/${ImagesPath[0]}',

                                fit: BoxFit.cover,
                              ),
                            ),
                          ), //产品图
                        ), //产品图
                        Container(
                          padding: EdgeInsets.only(left: maxWidth * 0.1),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            // color: Colors.purple,
                            width: maxWidth * 0.25, //产品信息描述框
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(
                                    bottom: 10,
                                    top: 8,
                                  ),
                                  child: Text(
                                    childrenItem['Name'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${childrenItem['SimpleDesc'].replaceAll(RegExp(r'(\n|\r)$'), '').toString()}',
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 8,
                                        letterSpacing: 0.3,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  // alignment: Alignment.centerLeft,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.,
                                    children: [
                                      Container(
                                        // padding: EdgeInsets.only(bottom: 10),
                                        height: 14,
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          '￥',
                                          style: TextStyle(fontSize: 8),
                                        ),
                                      ),
                                      Text(
                                        '${childrenItem['Price']}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 30,
                                          // width: 10,
                                          // alignment: Alignment.centerRight,
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            // color: Colors.white,

                                            child: DialogWidget(
                                              wrapper:Container(
                                                width: maxWidth * 0.1,
                                                // color: Colors.yellow,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      119, 185, 144, 1),
                                                  borderRadius:
                                                  BorderRadius.circular(4),
                                                ),
                                                child: Center(
                                                  child: const Text(
                                                    '选配',
                                                    style: TextStyle(
                                                        fontSize: 8),
                                                  ),
                                                ),
                                              ),
                                              dialogWidget:const Text('这是一个对话框'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ), //产品信息描述框
                        Expanded(
                          child: Container(
                            // color: Colors.red,
                            alignment: Alignment.center,
                            child: Container(
                              // color: Colors.purple,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
                                    width: maxWidth * 0.1,
                                    alignment: Alignment.center,
                                    child: Text('--',
                                        style: TextStyle(
                                          fontSize: 28,
                                        )),
                                    // color: Colors.red,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 6),
                                    alignment: Alignment.center,
                                    width: maxWidth * 0.1,
                                    // color: Colors.purple,
                                    child: Text(
                                      '已售：',
                                      style: TextStyle(fontSize: 8),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 6),
                                    alignment: Alignment.center,
                                    width: maxWidth * 0.1,
                                    // color: Colors.yellow  ,
                                    child: Text(
                                      '评分：',
                                      style: TextStyle(fontSize: 8),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: maxWidth * 0.1,
                                    // color: Colors.red,
                                    child: Text(
                                      '--',
                                      style: TextStyle(
                                        fontSize: 28,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ), //评分和销售数信息
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
