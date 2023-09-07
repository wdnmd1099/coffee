import 'package:flutter/material.dart';


class TakeFoodCard extends StatefulWidget {
  TakeFoodCard({super.key, required this.takeFoodData}){
    print(this.takeFoodData);
  }

  final List takeFoodData;

  @override
  State<TakeFoodCard> createState() => _TakeFoodCardState();
}

class _TakeFoodCardState extends State<TakeFoodCard> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Text(widget.takeFoodData[0]['Id']),
    );
    // return ListView.builder(
    //     itemCount: widget.takeFoodData.length,
    //     itemBuilder: (BuildContext context, int dataIndex) {
    //   var dataItem = widget.takeFoodData[dataIndex];
    //   return Container(
    //         padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
    //         color: Colors.transparent,
    //         child: Container(
    //           height: 165,
    //           padding: EdgeInsets.all(8),
    //           decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(4),
    //           ),
    //           child: Column(
    //             children: [
    //               Column(
    //                 children: [
    //                   Row(
    //                     children: [
    //                       Container(
    //                         child: Text(dataItem['店名'],style: TextStyle(fontSize: 12),),
    //                       ),
    //                       Expanded(
    //                         child: Container(
    //                           alignment: Alignment.centerRight,
    //                           padding: EdgeInsets.only(right: maxWidth * 0.2),
    //                           child: Text(dataItem['订单状态'],style: TextStyle(fontSize: 12),),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   Padding(
    //                     padding: EdgeInsets.only(top: 4),
    //                     child: Container(
    //                       width: maxWidth,
    //                       // padding: EdgeInsets.only(top: 8),
    //                       // alignment: Alignment.centerLeft,
    //                       height: 50,
    //                       child: Row(
    //                         children: [
    //                           Container(
    //                             alignment: Alignment.centerLeft,
    //                             child: Image.network(
    //                               dataItem['图片地址'],
    //                               width: 50,
    //                               height: 50,
    //                               fit: BoxFit.cover,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                   Padding(
    //                     padding: EdgeInsets.only(top: 4, bottom: 4),
    //                     child: Container(
    //                       width: maxWidth,
    //                       alignment: Alignment.centerLeft,
    //                       height: 20,
    //                       child: Text(dataItem['饮品名字'],style: TextStyle(fontSize: 12),),
    //
    //                     ),
    //                   ),
    //                   Padding(
    //                     padding: EdgeInsets.only(bottom: 4),
    //                     child:
    //                     Container(
    //                       child:  Row(
    //                         children: [
    //                          Container(
    //                            height: 16,
    //                            alignment: Alignment.bottomLeft,
    //                            child:  Text('￥',style: TextStyle(fontSize: 8),),
    //                          ),
    //                           Container(
    //                             alignment: Alignment.center,
    //                             child:  Text(dataItem['价钱'],style: TextStyle(fontSize: 16),),
    //                           ),
    //                           Container(
    //                             padding: EdgeInsets.only(left: 4),
    //                             height: 16,
    //                             alignment: Alignment.bottomLeft,
    //                             child:  Text('共1件',style: TextStyle(fontSize: 8),),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //
    //                   ),
    //                   Row(
    //                     children: [
    //                       Container(
    //                         height: 20,
    //                         alignment: Alignment.centerLeft,
    //                         child: Text('下单时间：${dataItem['时间']}',style: TextStyle(fontSize: 12),),
    //                       ),
    //                       Text(dataItem['付款状态'],style: TextStyle(fontSize: 12,color: dataItem['付款状态']=='去付款'?Colors.orange:Colors.black),),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ));
    //     }
    // );


  }
}
