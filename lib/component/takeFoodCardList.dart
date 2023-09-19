import 'dart:convert';

import 'package:coffee/views/orderDetailsPage.dart';
import 'package:flutter/material.dart';

class TakeFoodCard extends StatefulWidget {
  TakeFoodCard({super.key, required this.takeFoodData}) {
    // print(json.decode(this.takeFoodData[0]['ExtraOfGoods']) is List);
  }

  final List takeFoodData;

  @override
  State<TakeFoodCard> createState() => _TakeFoodCardState();
}

class _TakeFoodCardState extends State<TakeFoodCard> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
        itemCount: widget.takeFoodData.length,
        itemBuilder: (BuildContext context, dataIndex) {
          var dataItem = widget.takeFoodData[dataIndex];
          var listData = json.decode(dataItem['ExtraOfGoods']);
          // print(dataItem['OrderState'] is int);
          List orderState = [
            {0: '已创建'},
            {1: '已取消'},
            {2: '已支付'},
            {3: '机械手已接单'},
            {4: '机械手制作中'},
            {5: '机械手已完成'},
            {6: '已出餐'},
            {7: '已完成'}
          ];
          List payState = [
            {0: '等待支付'},
            {1: '支付成功'},
            {2: '支付失败'},
            {3: '支付取消'}
          ];
          String searchOrderState(int j) {
            if (j is int != true || j > 7) {
              throw '订单状态代码不是一个int或者订单代码不在规定范围内';
            }
            for (int i = 0; i < orderState.length; i++) {
              if (j == orderState[i].keys.first) {
                return orderState[i][i];
              }
            }
            return '订单代码不在范围';
          }

          String searchPayState(int j) {
            if (j is int != true || j > 4) {
              throw '订单状态代码不是一个int或者订单代码不在规定范围内';
            }
            for (int i = 0; i < payState.length; i++) {
              if (j == payState[i].keys.first) {
                return payState[i][i];
              }
            }
            return '订单代码不在范围';
          }

          reg(String time) {
            RegExp regex =
                RegExp(r'(\d{4}-\d{2}-\d{2})T(\d{2}:\d{2}:\d{2})-04:00');
            String modifiedTimestamp = time.replaceAllMapped(regex, (match) {
              return '${match.group(1)} ${match.group(2)}';
            });
            return modifiedTimestamp;
          }

          return Container(
              padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
              color: Colors.transparent,
              child: Container(
                height: 175,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text(
                                dataItem['ShopCode'] == 's001' ? '龙头店' : '启明里店',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: maxWidth * 0.1),
                                child: Text(
                                  searchOrderState(dataItem['OrderState']),
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            width: maxWidth,
                            // padding: EdgeInsets.only(top: 8),
                            // alignment: Alignment.centerLeft,
                            height: 50,
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Image.network(
                                    listData[0]['Image'],
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4, bottom: 4),
                          child: Container(
                            width: maxWidth,
                            alignment: Alignment.centerLeft,
                            height: 20,
                            child: Text(
                              listData[0]['Name'],
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Container(
                            // color: Colors.red,
                            child: Row(
                              children: [
                                Container(
                                  height: 16,
                                  alignment: Alignment.bottomLeft,
                                  child: const Text(
                                    '￥',
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    dataItem['RealPayAmount'],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 4),
                                  height: 16,
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    '共1件',
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => OrderDetailsPage()),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(right: maxWidth *0.1),
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: Colors.blue,
                                        ),
                                        child:   Text('查看订单',style: TextStyle(fontSize: 12),),
                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '下单时间：${reg(dataItem['CreatedAt'])}',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            Text(
                              '${searchPayState(dataItem['PayState'])}',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: dataItem['PayState'] == 1
                                      ? Colors.orange
                                      : Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        });
  }
}
