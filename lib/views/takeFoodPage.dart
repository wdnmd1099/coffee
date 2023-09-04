import 'package:flutter/material.dart';
import 'package:coffee/component/takeFoodCardList.dart';
import '../component/centerAppbar.dart';

class TakeFood extends StatefulWidget {
  const TakeFood({super.key});

  @override
  State<TakeFood> createState() =>
      _TakeFoodState();
}

class _TakeFoodState extends State<TakeFood> {
  List data = [
    {'店名':'龙头店','图片地址':'https://img0.baidu.com/it/u=3543035106,2121797620&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1693933200&t=5895b615bc65e4a1db430762726629aa',
      '饮品名字':'拿铁','订单状态':"已创建",'价钱':'22','时间':'2023-07-21 06:49:50','付款状态':'去付款'},
    {'店名':'街角店','图片地址':'https://img0.baidu.com/it/u=3543035106,2121797620&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1693933200&t=5895b615bc65e4a1db430762726629aa',
      '饮品名字':'拿铁','订单状态':"已支付",'价钱':'22','时间':'2023-07-21 06:49:50','付款状态':'显示取餐码'},
    {'店名':'龙头店','图片地址':'https://img0.baidu.com/it/u=3543035106,2121797620&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1693933200&t=5895b615bc65e4a1db430762726629aa',
      '饮品名字':'拿铁','订单状态':"已支付",'价钱':'22','时间':'2023-07-21 06:49:50','付款状态':'显示取餐码'},
    {'店名':'龙头店','图片地址':'https://img0.baidu.com/it/u=3543035106,2121797620&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1693933200&t=5895b615bc65e4a1db430762726629aa',
      '饮品名字':'拿铁','订单状态':"已支付",'价钱':'22','时间':'2023-07-21 06:49:50','付款状态':'显示取餐码'},
    {'店名':'龙头店','图片地址':'https://img0.baidu.com/it/u=3543035106,2121797620&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1693933200&t=5895b615bc65e4a1db430762726629aa',
      '饮品名字':'拿铁','订单状态':"已支付",'价钱':'22','时间':'2023-07-21 06:49:50','付款状态':'显示取餐码'},
    {'店名':'龙头店','图片地址':'https://img0.baidu.com/it/u=3543035106,2121797620&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1693933200&t=5895b615bc65e4a1db430762726629aa',
      '饮品名字':'拿铁','订单状态':"已支付",'价钱':'22','时间':'2023-07-21 06:49:50','付款状态':'显示取餐码'},
    {'店名':'龙头店','图片地址':'https://img0.baidu.com/it/u=3543035106,2121797620&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1693933200&t=5895b615bc65e4a1db430762726629aa',
      '饮品名字':'拿铁','订单状态':"已支付",'价钱':'22','时间':'2023-07-21 06:49:50','付款状态':'显示取餐码'},
    {'店名':'龙头店','图片地址':'https://img0.baidu.com/it/u=3543035106,2121797620&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1693933200&t=5895b615bc65e4a1db430762726629aa',
      '饮品名字':'拿铁','订单状态':"已支付",'价钱':'22','时间':'2023-07-21 06:49:50','付款状态':'显示取餐码'},
    {'店名':'龙头店','图片地址':'https://img0.baidu.com/it/u=3543035106,2121797620&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1693933200&t=5895b615bc65e4a1db430762726629aa',
      '饮品名字':'拿铁','订单状态':"已支付",'价钱':'22','时间':'2023-07-21 06:49:50','付款状态':'显示取餐码'},

    // {'店名':'','图片地址':'','订单状态':"已创建",'价钱':'','时间':'','付款状态':''}
  ] ;
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(maxHeight * 0.05), //Appbar高度
        child: CenterAppbar(
          titleName: '取餐',
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 12),
        // height: maxHeight,
        // width: maxWidth,
        color: Colors.grey[200],
        child: TakeFoodCard(takeFoodData: data,),
      ),
    );
  }
}