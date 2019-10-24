
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class List extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State {
  final _titles = <String>["吕不","貂蝉","庄周","程咬金","妲己","钟无艳"];
  final _desArray = <String>["我的貂蝉在哪里","喂，你的脑袋里在想什么低级趣味的事吗","一群人在人家梦里打来打去，有意思吗","两个字:揍他!","请尽情吩咐妲己，主人","女神和女汉子只隔着一个夏天"];
  final _avatars = <String>["images/item1.jpeg","images/item2.jpeg","images/item3.jpg","images/item4.jpg","images/item5.jpeg","images/item6.jpg"];
  final _saved = new Set<String>();
  final _biggerFont = const TextStyle(fontSize: 16.0);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('List'),
      ),
      body: _buildSuggestions(context),
    );
  }

  Widget _buildSuggestions(context) {
    return new ListView.separated(
      padding: const EdgeInsets.all(10.0),
      itemCount: _titles.length,
      separatorBuilder:(context, int index) => new Divider(), // 添加分割线
      itemBuilder: (context,index) {
        return _buildRow(_titles[index],_avatars[index],_desArray[index]);
      },
    );
  }

  Widget _buildRow(title,avatar,des) {
    final alreadySaved = _saved.contains(title);
    return new ListTile(
      contentPadding: EdgeInsets.fromLTRB(6, 0, 0, 0),
      title: new Text(
        title,
        style: _biggerFont,
      ),
      leading: CircleAvatar(
        backgroundImage:AssetImage(avatar),
      ),
      subtitle: new Text(
          des,
        style: TextStyle(fontSize: 14,color: const Color.fromRGBO(06, 06, 06,1),),
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),

      onTap: () {
        setState(() {
          if(alreadySaved) {
            _saved.remove(title);
          } else {
            _saved.add(title);
          }
        });
      },
    );
  }
}