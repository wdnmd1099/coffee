import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee/stateManage/stateManage.dart';

class OptionCardList extends StatefulWidget {
  final List optionList;

  const OptionCardList({super.key, required this.optionList});

  @override
  State<OptionCardList> createState() => _OptionCardListState();
}

class _OptionCardListState extends State<OptionCardList> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    var eee = [{'状态':['冰(推荐)','比较烫','温']},{'糖量':['少糖','少少糖','多糖']}];
    final changeMenuOptions = Provider.of<ChangeMenuOptions>(context);
    return changeMenuOptions.isHot == false
        ? ListView.builder(
            itemCount: widget.optionList.length, //数组长度
            itemBuilder: (BuildContext context, int index) {
              var item = widget.optionList[index]; //index是当前元素的下标，这样就指当前元素
              return Column(
                children: [
                  Text('${item.keys.first}'),
                  Container(
                    color: Colors.orange,
                    height: maxHeight * 0.05,
                    width: maxWidth * 0.8,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: item[item.keys.first].length, //数组长度
                        itemBuilder: (BuildContext context, int index1) {
                          var item1 = item[item.keys.first][index1];
                          // print(item1);
                          return Container(
                            color: Colors.red,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        {test(item1, changeMenuOptions)},
                                    child: Text(
                                      '${item1}',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            },
          )

















        : ListView.builder(
            itemCount: eee.length, //数组长度
            itemBuilder: (BuildContext context, int index) {
              var item = eee[index]; //index是当前元素的下标，这样就指当前元素
              return Column(
                children: [
                  Text('${item.keys.first}'),
                  Container(
                    color: Colors.orange,
                    height: maxHeight * 0.05,
                    width: maxWidth * 0.8,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: item[item.keys.first]?.length, //数组长度
                        itemBuilder: (BuildContext context, int index1) {
                          var item1 = item[item.keys.first]?[index1];
                          // print(item1);
                          return Container(
                            color: Colors.red,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        {test(item1, changeMenuOptions)},
                                    child: Text(
                                      '${item1}',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            },
          );
  }
}

test(item233, _changeMenuOptions) {
  if (item233 == '温') {
    print('是温的');
    _changeMenuOptions.Hot();
  } else {
    print('不是温的');
    _changeMenuOptions.Cold();
  }
}
