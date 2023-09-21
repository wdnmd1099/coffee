import 'dart:convert';

import 'package:coffee/component/optionCardList.dart';
import 'package:flutter/material.dart';
import 'maskDialog.dart';


class MenuCardList extends StatefulWidget {
  MenuCardList({super.key, required this.meun,this.setIndex});
  Function? setIndex;
  final List meun;

  @override
  State<MenuCardList> createState() => _MenuCardListState();
}

class _MenuCardListState extends State<MenuCardList> {

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    var x = [
      [
        {
          '状态': [
            '冰(推荐)',
            '比较烫',
            '温',
          ]
        },
        {
          '冰量': [
            '推荐',
            '少冰',
            '少少冰',
            '去冰',
          ]
        },
        {
          '茶底': [
            '绿妍(推荐)',
            '百岁山(不推荐)',
            '去茶底',
          ]
        },
        {
          '糖量': [
            '正常糖',
            '少糖',
            '少少糖',
            '多糖',
          ]
        },
        {
          '加大料': [
            '八角',
            '话梅',
            '陈皮',
            '桂皮',
          ]
        },
      ],
      [ {
        '状态': ['冰(推荐)', '比较烫', '温'],
      },
        {
          '茶底': [
            '绿妍(推荐)',
            '百岁山(不推荐)',
            '去茶底',
          ],
        },
        {
          '糖量': [
            '正常糖',
            '少糖',
            '少少糖',
            '多糖',
          ],
        },
        {
          "加小料": [
            '红豆',
            '珍珠',
            '青稞',
            '什么冻',
          ],
        },],
      [ {
        '状态': ['冰(推荐)', '比较烫', '温'],
      },
        {
          '茶底': [
            '绿妍(推荐)',
            '百岁山(不推荐)',
            '去茶底',
          ],
        },
        {
          '糖量': [
            '正常糖',
            '少糖',
            '少少糖',
            '多糖',
          ],
        },
        {
          "加小料": [
            '红豆',
            '珍珠',
            '青稞',
            '什么冻',
          ],
        },],
    ];
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

                                fit: BoxFit.cover, //fill就可以看到全图，但是会变形，cover不会变形但会看不到全图
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

                                            child: MaskDialog(
                                              setIndex: widget.setIndex,
                                              wrapper:Container(
                                                width: maxWidth * 0.1,
                                                // color: Colors.yellow,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      119, 185, 144, 1),
                                                  borderRadius:
                                                  BorderRadius.circular(4),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    '选配',
                                                    style: TextStyle(
                                                        fontSize: 8),
                                                  ),
                                                ),
                                              ),
                                              dialogWidget:Container(
                                                height: maxHeight * 0.7,
                                                width: maxWidth,
                                                // color: Colors.yellow,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8),
                                                  color: Colors.white,
                                                ),

                                                child: OptionCardList(
                                                  optionList: x,
                                                  sameMode: true,
                                                  changeOption: '状态',
                                                  btnTitle: '加入购物车',
                                                ),
                                              ),
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
