import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee/stateManage/stateManage.dart';

class OptionCardList extends StatefulWidget {
  final List optionList;
  List<Map<String, dynamic>> eee = [
    {
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
  ];

  OptionCardList({super.key, required this.optionList});

  @override
  State<OptionCardList> createState() => _OptionCardListState();
}

class _OptionCardListState extends State<OptionCardList> {
  Map selectedValues = {};
  Map changedSelectedValues = {};

  @override
  void initState() {
    super.initState();
    for(int i=0;i<widget.optionList.length;i++){
      selectedValues[widget.optionList[i].keys.first] = 0;
    }
    for(int i=0;i<widget.eee.length;i++){
      changedSelectedValues[widget.eee[i].keys.first] = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                              for (int i = 0; i < item[item.keys.first].length; i++)
                                ElevatedButton(
                                  onPressed: () => {
                                    setState(() {
                                      test(item[item.keys.first]?[i], changeMenuOptions);
                                      if(item.keys.first != '状态'){
                                        selectedValues[item.keys.first] = i;
                                      }
                                      else if((item.keys.first == '状态')){
                                        selectedValues[item.keys.first] = i;
                                        changedSelectedValues[item.keys.first] = i;
                                      }
                                      // print(selectedValues);
                                      // print(changedSelectedValues);
                                    })
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    backgroundColor: selectedValues[item.keys.first] == i
                                        ? Colors.black
                                        : Colors.grey,
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
            itemCount: widget.eee.length, //数组长度
            itemBuilder: (BuildContext context, int index1) {
              var item1 = widget.eee[index1]; //index是当前元素的下标，这样就指当前元素
              if (item1[item1.keys.first] == null ||
                  item1[item1.keys.first]?.length == 0) {
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
                              for (int i = 0;
                                  i < item1[item1.keys.first]!.length; i++)
                                ElevatedButton(
                                  onPressed: () => {
                                    setState(() {
                                      test(item1[item1.keys.first]?[i], changeMenuOptions);
                                      if(item1.keys.first != '状态'){
                                        changedSelectedValues[item1.keys.first] = i;
                                      }
                                      else if((item1.keys.first == '状态')){
                                        selectedValues[item1.keys.first] = i;
                                        changedSelectedValues[item1.keys.first] = i;
                                      }
                                      // print(selectedValues);
                                      // print(changedSelectedValues);
                                    })
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    backgroundColor: changedSelectedValues[item1.keys.first] == i
                                        ? Colors.black
                                        : Colors.grey,
                                  ),
                                  child: Container(
                                    child:
                                        Text('${item1[item1.keys.first]?[i]}'),
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

test(item233, _changeMenuOptions) {
  // print(item233);
  if (item233 == '温' || item233 == '比较烫') {
    // print('是温的');
    _changeMenuOptions.Hot();
  } else if (item233 == '冰(推荐)') {
    // print('不是温的');
    _changeMenuOptions.Cold();
  }
}
