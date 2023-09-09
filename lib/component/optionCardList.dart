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
    List<Map<String, dynamic>> eee = [
      {
        '状态': ['冰(推荐)', '比较烫', '温'],
        '选中':0,
      },
      {
        '茶底': [
          '绿妍(推荐)',
          '百岁山(不推荐)',
          '去茶底',
        ],
        '选中':0,
      },
      {
        '糖量': [
          '正常糖',
          '少糖',
          '少少糖',
          '多糖',
        ],
        '选中':0,
      },
    ];
    final changeMenuOptions = Provider.of<ChangeMenuOptions>(context);
    return changeMenuOptions.isHot == false
        ? ListView.builder(
            // shrinkWrap: true,
            //       physics: NeverScrollableScrollPhysics(),
            itemCount: widget.optionList.length, //数组长度
            itemBuilder: (BuildContext context, int index) {
              var item = widget.optionList[index]; //index是当前元素的下标，这样就指当前元素
              return Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 8, top: 8),
                      child: Text(
                        '${item.keys.first}',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    // height: maxHeight * 0.2,
                    // width: maxWidth * 0.8,
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      // scrollDirection: Axis.horizontal,
                      // itemCount: item[item.keys.first].length, //数组长度
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Wrap(
                            direction: Axis.horizontal,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 8.0,
                            // 元素之间的间距
                            runSpacing: 8.0,
                            // 换行时行与行之间的间距
                            children: [
                              for (int i = 0;
                                  i < item[item.keys.first].length;
                                  i++)
                                ElevatedButton(
                                  onPressed: () => {
                                    test(item[item.keys.first][i],
                                        changeMenuOptions)
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    backgroundColor: Colors.black,
                                  ),
                                  child: Container(
                                    // color: Colors.black,
                                    child: Text('${item[item.keys.first][i]}'),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            // shrinkWrap: true,
            //       physics: NeverScrollableScrollPhysics(),
            itemCount: eee.length, //数组长度
            itemBuilder: (BuildContext context, int index1) {
              var item1 = eee[index1]; //index是当前元素的下标，这样就指当前元素
              List<String> keys = item1[item1.keys.first].toList();
              String selectedKeys = keys[0];
              print(keys[0]);
              if(item1[item1.keys.first] == null || item1[item1.keys.first]?.length == 0){
                print('更新的数组内容为空');
                throw '更新的数组内容为空';
              }
              return Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 8, top: 8),
                      child: Text(
                        '${item1.keys.first}',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Wrap(
                            direction: Axis.horizontal,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 8.0,
                            // 元素之间的间距
                            runSpacing: 8.0,
                            // 换行时行与行之间的间距
                            children: [
                              for (int i = 0; i < item1[item1.keys.first]!.length; i++)
                                ElevatedButton(
                                  onPressed: () => {
                                     test(item1[item1.keys.first]?[i], changeMenuOptions)
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    backgroundColor: selectedKeys!=null?Colors.black:Colors.grey,
                                  ),
                                  child: Container(
                                    child: Text('${item1[item1.keys.first]?[i]}'),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
  }
}

int test2 = 1;

String test(item233, _changeMenuOptions, ) {
  if (item233 == '温' || item233 == '比较烫') {
    // print('是温的');
    _changeMenuOptions.Hot();
  } else if(item233 == '冰(推荐)'){
    // print('不是温的');
    _changeMenuOptions.Cold();
  }
  else if(item233 == '少少糖'){
    print('少少糖');
    test2 = 2;
    print(test2);
  }

  return item233;
}
