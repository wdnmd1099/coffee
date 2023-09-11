import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee/stateManage/stateManage.dart';

class OptionCardList extends StatefulWidget {
  final List optionList;
  final List<Map<String, dynamic>> eee = [
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
    {
      "加小料": [
        '红豆',
        '珍珠',
        '青稞',
        '什么冻',
      ],
    },
  ];

  OptionCardList({super.key, required this.optionList});

  @override
  State<OptionCardList> createState() => _OptionCardListState();
}

class _OptionCardListState extends State<OptionCardList> {
  Map showValues = {};
  Map selectedValues = {};
  Map changedSelectedValues = {};

  List showList = [];
  List testList = [];
  List changedList = [];
  @override
  void initState() {
    super.initState();
    testList = widget.optionList;
    changedList = widget.eee;
    showList = testList;

    for (int i = 0; i < widget.optionList.length; i++) {
      selectedValues[widget.optionList[i].keys.first] = widget.optionList[i][widget.optionList[i].keys.first][0];
      // print(widget.optionList[i].keys.first);
      // print(widget.optionList[i][widget.optionList[i].keys.first][0]);
    }
    for (int i = 0; i < widget.eee.length; i++) {
      changedSelectedValues[widget.eee[i].keys.first] = widget.eee[i][widget.eee[i].keys.first][0];
    }
    showValues = selectedValues;

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // shrinkWrap: true,
      //       physics: NeverScrollableScrollPhysics(),
      itemCount: showList.length, //数组长度
      itemBuilder: (BuildContext context, int index) {
        var item = showList[index]; //index是当前元素的下标，这样就指当前元素
        // print(changedSelectedValues);
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
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
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
                                if ((item.keys.first == '状态')) {
                                  //下面两行是使状态选项的背景颜色保持一致
                                  selectedValues[item.keys.first] = item[item.keys.first][i];
                                  changedSelectedValues[item.keys.first] = item[item.keys.first][i];

                                  if(item[item.keys.first][i] == '比较烫' || item[item.keys.first][i] == '温'){
                                    //把冰的页面点过的设置复制给 温 和 比较烫 的页面
                                    selectedValues.forEach((key, value) {
                                      if(changedSelectedValues[key] != null){
                                        if(value != changedSelectedValues[key]){
                                          changedSelectedValues[key] = value;
                                        }
                                      }
                                      // print( changedSelectedValues);
                                      // print(value);
                                    });

                                    //显示它对应选项的页面
                                    showValues = changedSelectedValues;
                                    showList = changedList;
                                  }else{
                                    changedSelectedValues.forEach((key, value) {
                                      if(selectedValues[key] != null){
                                        if(value != selectedValues[key]){
                                          selectedValues[key] = value;
                                        }
                                      }
                                      // print( changedSelectedValues);
                                      // print(value);
                                    });
                                    //显示它对应选项的页面
                                    showValues = selectedValues;
                                    showList = testList;
                                  }
                                }else if (item.keys.first != '状态') {
                                  // print();
                                  if(showValues['状态'] == '冰(推荐)'){
                                    selectedValues[item.keys.first] = item[item.keys.first][i];
                                  }else{
                                    changedSelectedValues[item.keys.first] = item[item.keys.first][i];
                                  }
                                  // print(selectedValues);
                                  // print(changedSelectedValues);
                                }

                              })
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              backgroundColor:
                              showValues[item.keys.first] == item[item.keys.first][i]
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
    );
  }
}

