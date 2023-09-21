import 'package:flutter/material.dart';

class FoodDetailsCardList extends StatefulWidget {
  FoodDetailsCardList(
      {super.key,
      this.picturePath,
      required this.drinksTitle,
      required this.drinksInformation,
      required this.drinksNum,
      required this.price});

  String? picturePath;
  String drinksTitle;
  String drinksInformation; //饮品定制信息：正常冰，三分糖之类的
  int drinksNum;
  int price;

  @override
  State<FoodDetailsCardList> createState() => _FoodDetailsCardListState();
}

class _FoodDetailsCardListState extends State<FoodDetailsCardList> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 64,
          width: 64,
          color: Colors.red,
        ), //图片
        Container(
          padding: EdgeInsets.only(left: 8),
          alignment: Alignment.centerLeft,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 64 / 3,
                child: Text(
                  '${widget.drinksTitle}',
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                // color: Colors.green,
                width: 150,
                height: 64 / 3,
                child: Text(
                  '${widget.drinksInformation}',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Color.fromRGBO(138, 138, 138, 1),
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 64 / 3,
                alignment: Alignment.bottomLeft,
                // color: Colors.purple,
                child: Text(
                  '${widget.drinksNum}',
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Color.fromRGBO(138, 138, 138, 1),
                  ),
                ),
              ),
            ],
          ),
        ), //订单饮品信息
        Expanded(
          child: Container(
            height: 64,
            alignment: Alignment.topRight,
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '￥${widget.price}',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
