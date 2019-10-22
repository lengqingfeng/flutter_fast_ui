import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Fast UI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _dataSource = <String>["布局","登录","model","后裔","西施","貂蝉"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: _buildListView(context),
    );
  }

  //构建ListView方法
  Widget _buildListView(context) {
    return new ListView.separated(
      //padding: EdgeInsets.symmetric(horizontal: 5),
      itemBuilder: (context,index) {
        return _buildRow(_dataSource[index],index);
      },
      separatorBuilder:(context,int index) => Divider(),
      itemCount: _dataSource.length,
    );

  }


  //构建Row方法
  Widget _buildRow(value,index) {
    return new ListTile(
      //间距 系统默认间距也是16 如果设计图不是16 需要设置该函数
      //contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
      title: new Text(
        //标题
        value,
        //字号16 颜色 030303
        style: TextStyle(fontSize: 16,color: const Color.fromRGBO(03, 03, 03,1),),
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap:() {

      },
    );
  }
}
