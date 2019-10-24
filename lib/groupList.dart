import 'package:flutter/material.dart';

class GroupList extends StatefulWidget {
  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  final _dataSource = <String>["支付", "收藏", "相册", "卡包", "表情", "设置"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Group List'),
      ),
      body: _buildListView(context),
      //分割线
    );
  }

  //构建ListView方法
  Widget _buildListView(context) {
    var i = 0;
    return new ListView.builder(
      itemBuilder: (context, index) {
        var isGroup = false;
        i = index;
        if (index == 1 || index == 5 || index == 6) {
          isGroup = true;
        }
        if (index == 0) {
          return _buildListHead();
        } else {
          return _buildRow(_dataSource[index - 1], index, isGroup);
        }
      },
//      itemExtent:56,
      itemCount: _dataSource.length + 1,
    );
  }

  Widget _buildListHead() {
    return new Container(
      height: 120,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(
                width: 10, color: Theme.of(context).scaffoldBackgroundColor)),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: new Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(6.0),
                image: DecorationImage(
                  image: AssetImage("images/item1.jpeg"),
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
                  height: 50.0,
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Allen',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '微信号:lengshengren',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black38),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.insert_chart,
                                    color: Colors.black45,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ))),
        ],
      ),
    );
  }

  //构建Row方法
  Widget _buildRow(value, index, isGroup) {
    print(value);
    return new Container(
      height: 56,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
                width: isGroup == true ? 10 : 0,
                color: isGroup == true
                    ? Theme.of(context).scaffoldBackgroundColor
                    : Color(0xffffff)),
          )),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Image.asset(
              "images/item1.jpeg",
              width: 30,
              height: 30,
              alignment: Alignment.centerLeft,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  width: isGroup == true ? 0 : 1,
                  color: isGroup == true
                      ? Color(0xffffff)
                      : Theme.of(context).scaffoldBackgroundColor,
                ),
              )),
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(value),
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black45,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
